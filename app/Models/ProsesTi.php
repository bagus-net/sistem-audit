<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProsesTi extends Model
{
    use HasFactory;
    public function klausul() {
    return $this->belongsTo(Klausul::class);
}

public function jawabanAudit() {
    return $this->hasMany(JawabanAudit::class);
}
}
