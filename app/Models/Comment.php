<?php


namespace App\Models;


/**
 * App\Models\Comment
 *
 * @property int $id
 * @property int $uid 用户Uid
 * @property int $goods_id 商品Id
 * @property int $order_goods_id 商品订单ID
 * @property int $num 购买的数量
 * @property string $order_no 订单编号
 * @property string $goods_name 商品名称
 * @property string $sku 规格
 * @property int|null $status 状态[0、审核中; 1、审核通过; 2、审核驳回]
 * @property string $goods_thumb 商品封面
 * @property string $picture 评论的图片
 * @property string $member_name 会员昵称
 * @property string $member_icon 评论用户头像
 * @property int|null $comment_rank 评价等级，1、表示非常差，2、表示差，3、表示一般，4、表示好，5、表示非常好
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder|Comment newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Comment newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Comment query()
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereCommentRank($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereGoodsId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereGoodsName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereGoodsThumb($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereMemberIcon($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereMemberName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereNum($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereOrderGoodsId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereOrderNo($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment wherePicture($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereSku($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereUid($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Comment whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Comment extends Model
{
    protected $table = 'store_goods_comment';

    protected $primaryKey = 'id';

    protected $guarded = [];
}
