<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class klausul extends Model
{
    use HasFactory;

    protected $fillable = ['domain_id', 'kode_klausul', 'nama_klausul', 'deskripsi'];

    public function domain() {
        return $this->belongsTo(Domain::class);
    }

    public function prosesTi() {
        return $this->hasMany(ProsesTi::class);
    }
}
