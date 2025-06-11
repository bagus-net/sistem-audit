<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProsesTi extends Model
{
    use HasFactory;

    protected $fillable = ['klausul_id', 'kode_proses', 'level', 'nama_proses', 'pertanyaan'];

    public function klausul() {
        return $this->belongsTo(Klausul::class);
    }

    public function domain() {
        return $this->belongsTo(Domain::class);
    }

    public function jawabanAudit() {
        return $this->hasMany(JawabanAudit::class);
    }
}
