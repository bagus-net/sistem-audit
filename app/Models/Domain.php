<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Domain extends Model
{
    use HasFactory;
    protected $fillable = ['kode_domain','nama_domain','deskripsi'];

    public function klausuls() {
    return $this->hasMany(Klausul::class);
}
}
