<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class klausul extends Model
{
    use HasFactory;

    protected $fillable = ['kode_klausul', 'nama_klausul', 'deskripsi'];

    public function prosesTi() {
        return $this->hasMany(ProsesTi::class);
    }
}
