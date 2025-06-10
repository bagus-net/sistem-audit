<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJawabanAuditsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jawaban_audits', function (Blueprint $table) {
    $table->id();
    $table->foreignId('proses_ti_id')->constrained();
    $table->foreignId('user_id')->constrained(); // Auditor
    $table->enum('jawaban', ['Sudah', 'Belum', 'Tidak Berlaku']);
    $table->text('catatan')->nullable();
    $table->string('bukti_path')->nullable(); // Path file bukti
    $table->timestamp('tanggal_audit')->useCurrent();
    $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jawaban_audits');
    }
}
