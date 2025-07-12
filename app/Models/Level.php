<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Level extends Model
{
    use HasFactory;

    protected $fillable = [
        'klausul_id',
        'level',
        'sub_proses',
    ];

    public function klausul()
    {
        return $this->belongsTo(Klausul::class);
    }

    public function questions()
    {
        return $this->hasMany(Question::class);
    }
}
