<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JawabanAudit extends Model
{
    use HasFactory;
    public function prosesTi() {
    return $this->belongsTo(ProsesTi::class);
}

public function user() {
    return $this->belongsTo(User::class);
}
}
