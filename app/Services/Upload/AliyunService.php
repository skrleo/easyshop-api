<?php
/*
 * @author: ChenGuangHui
 */
namespace App\Services\Upload;

use App\Contracts\OssInterface;
use App\Exceptions\RJsonError;
use OSS\Core\OssException;
use OSS\Core\OssUtil;
use OSS\OssClient;

class AliyunService implements OssInterface
{
     /**
     * 阿里云OSS分片上传
     * @param $file
     * @param array $attributes
     * @return array
     * @throws RJsonError
     */
    public function upload($file, array $attributes = [])
    {
        $bucket = config('config.aliyun.bucket');
        try {
            $ossClient = new OssClient(config('config.aliyun.access_key'), config('config.aliyun.access_secret'), config('config.aliyun.endpoint'));
            $uploadId = $ossClient->initiateMultipartUpload($bucket, trim($attributes['file_path'], '/') . '/' . $attributes['original_name']);
        } catch (OssException $e) {
            throw new RJsonError('阿里云OSS配置错误！');
        }

        $pieces = $ossClient->generateMultiuploadParts(filesize($file));
        $responseUploadPart = array();
        $uploadPosition = 0;
        $isCheckMd5 = true;
        foreach ($pieces as $i => $piece) {
            $fromPos = $uploadPosition + (integer)$piece[$ossClient::OSS_SEEK_TO];
            $toPos = (integer)$piece[$ossClient::OSS_LENGTH] + $fromPos - 1;
            $upOptions = array(
                $ossClient::OSS_FILE_UPLOAD => $file,
                $ossClient::OSS_PART_NUM => ($i + 1),
                $ossClient::OSS_SEEK_TO => $fromPos,
                $ossClient::OSS_LENGTH => $toPos - $fromPos + 1,
                $ossClient::OSS_CHECK_MD5 => $isCheckMd5,
            );
            if ($isCheckMd5) {
                $contentMd5 = OssUtil::getMd5SumForFile($file, $fromPos, $toPos);
                $upOptions[$ossClient::OSS_CONTENT_MD5] = $contentMd5;
            }

            try {
                $responseUploadPart[] = $ossClient->uploadPart($bucket, trim($attributes['file_path'], '/') . '/' . $attributes['original_name'], $uploadId, $upOptions);
            } catch (OssException $e) {
                throw new RJsonError($e->getMessage());
            }
        }
        $uploadParts = array();
        foreach ($responseUploadPart as $i => $eTag) {
            $uploadParts[] = array(
                'PartNumber' => ($i + 1),
                'ETag' => $eTag,
            );
        }
        try {
            $ossClient->completeMultipartUpload($bucket, trim($attributes['file_path'], '/') . '/' . $attributes['original_name'], $uploadId, $uploadParts);
        } catch (OssException $e) {
            throw new RJsonError($e->getMessage());
        }

        return array(
            'file_name' => $attributes['original_name'],
            'file_size' => filesize($file),
            'file_path' => $attributes['file_path'],
            'file_type' => $attributes['extension'],
            'original_name' => $attributes['original_name'],
            'hash' => hash_file('md5', $file),
            'file_url' => 'https://img.easyshop.org.cn/' . trim($attributes['file_path'], '/') . '/' . $attributes['original_name']
        );
    }
}