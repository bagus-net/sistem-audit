<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_project',
        'auditor',
        'klausul',
    ];

    public function auditAnswers()
    {
        return $this->hasMany(AuditAnswer::class);
    }

    public function klausuls()
    {
        return $this->belongsToMany(\App\Models\Klausul::class, 'klausul_project');
    }
}
