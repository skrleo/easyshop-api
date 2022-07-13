<?php
/**
 * Created by PhpStorm.
 * User: chenguanghui
 * Date: 2021/2/2
 * Time: 15:55
 */
namespace App\Models;


/**
 * App\Models\Lexicon
 *
 * @property int $id
 * @property string $name 名称
 * @property string $key
 * @property string $value
 * @property int $sort
 * @property int $status
 * @property \Illuminate\Support\Carbon|null $updated_at 修改时间
 * @property \Illuminate\Support\Carbon $created_at 添加时间
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon query()
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereKey($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereSort($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Lexicon whereValue($value)
 * @mixin \Eloquent
 */
class Lexicon extends Model
{
    protected $table = 'store_lexicon';

    protected $primaryKey = 'id';
}