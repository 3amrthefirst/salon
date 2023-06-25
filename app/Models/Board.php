<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Board extends Model
{
    protected $table = "boards";
    protected $fillable = [
        'image' ,
        'title',
    ];
    public $timestamps = true ;

    public function getImageAttribute($value)
    {
        if (isset($this->attributes['image']))
        {
            return url($value);
        }else{
            return null;
        }
    }
}
