<?php


namespace App\Models;

class BlindBox extends Model
{
    protected $table = 'store_blind_box';

    protected $primaryKey = 'id';


    public function blindBoxRule()
    {
        return $this->hasMany(BlindBoxRule::class, 'blind_box_id', 'id');
    }
}
