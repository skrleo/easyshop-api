<?php
/**
 * Created by PhpStorm.
 * User: chen
 * Date: 2020/7/4
 * Time: 21:13
 */

namespace App\Models;


use DateTimeInterface;
use Illuminate\Database\Eloquent\Builder;

/**
 * App\Models\Model
 *
 * @method static \Illuminate\Database\Eloquent\Builder|Model newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Model newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Model query()
 * @mixin \Eloquent
 */
class Model extends \Illuminate\Database\Eloquent\Model
{

    /**
     * @var string 统一使用时间戳
     */
    // protected $dateFormat = 'U';

    /**
     * @param DateTimeInterface $date
     * @return string
     */
    protected function serializeDate(DateTimeInterface $date): string
    {
        return $date->format('Y-m-d H:i:s');
    }

    /**
     * @param $sql
     * @param $where
     * @return mixed
     */
    public function handleWhere(Builder $sql, $where)
    {
        foreach ($where as $k => $v) {
            if (!is_array($v)) {
                $sql->where($k, $v);
                continue;
            }
            switch ($v[0]) {
                case 'between':
                    $sql = $sql->whereBetween($k, $v[1]);
                    break;
                case 'not between':
                    $sql = $sql->whereNotBetween($k, $v[1]);
                    break;
                case 'in':
                    $sql = $sql->whereIn($k, $v[1]);
                    break;
                case 'not in':
                    $sql = $sql->whereNotIn($k, $v[1]);
                    break;
                case 'gt':
                    $sql = $sql->where($k, '>', $v[1]);
                    break;
                case 'lt':
                    $sql = $sql->where($k, '<', $v[1]);
                    break;
                case 'egt':
                    $sql = $sql->where($k, '>=', $v[1]);
                    break;
                case 'elt':
                    $sql = $sql->where($k, '<=', $v[1]);
                    break;
                case 'like':
                    $sql = $sql->where($k, 'like', $v[1]);
                    break;
                case 'not like':
                    $sql = $sql->where($k, 'not like', $v[1]);
                    break;
                case 'neq':
                    $sql = $sql->where($k, '<>', $v[1]);
                    break;

                default:
                    break;
            }
        }
        return $sql;
    }
}
