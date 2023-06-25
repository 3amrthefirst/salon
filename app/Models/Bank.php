<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    protected $table = "banks" ;
    protected $fillable = [
        'salon_id',
        'bank_name' ,
        'account_number',
        'IBAN',
    ];
    public $timestamps = true ;

    public function salons()
    {
        return $this->belongsTo(Salon::class);
    }
}
