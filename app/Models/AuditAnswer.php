<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuditAnswer extends Model
{
    use HasFactory;

    protected $fillable = [
        'project_id',
        'klausul_id',
        'level_id',
        'question_id',
        'jawaban',
        'bukti_hasil_kerja',
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
    public function klausul()
    {
        return $this->belongsTo(Klausul::class);
    }
    public function level()
    {
        return $this->belongsTo(Level::class);
    }
    public function question()
    {
        return $this->belongsTo(Question::class);
    }
}
