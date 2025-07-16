
<?php

use App\Http\Controllers\DomainController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController; // Moved outside the comment block

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::get('/register', [AuthController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/', function () {
    return redirect()->route('login');
});
use App\Http\Controllers\DashboardController;

Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
use App\Http\Controllers\UserController;

Route::resource('users', UserController::class);
// Rute untuk Domain
Route::get('domain', [DomainController::class, 'index'])->name('domain.index');
Route::get('domain/create', [DomainController::class, 'create'])->name('domain.create');
Route::post('domain', [DomainController::class, 'store'])->name('domain.store');
Route::get('domain/{id}', [DomainController::class, 'show'])->name('domain.show');
Route::get('domain/{id}/edit', [DomainController::class, 'edit'])->name('domain.edit');
Route::post('domain/{id}', [DomainController::class, 'update'])->name('domain.update');
Route::delete('domain/{id}', [DomainController::class, 'destroy'])->name('domain.destroy');

// Rute untuk ProsesTi (Pertanyaan)
use App\Http\Controllers\ProsesTiController;

Route::get('proses_ti', [ProsesTiController::class, 'index'])->name('proses_ti.index');
Route::get('proses_ti/create', [ProsesTiController::class, 'create'])->name('proses_ti.create');
Route::post('proses_ti', [ProsesTiController::class, 'store'])->name('proses_ti.store');
Route::get('proses_ti/{id}', [ProsesTiController::class, 'show'])->name('proses_ti.show');
Route::get('proses_ti/{id}/edit', [ProsesTiController::class, 'edit'])->name('proses_ti.edit');
Route::post('proses_ti/{id}', [ProsesTiController::class, 'update'])->name('proses_ti.update');
Route::delete('proses_ti/{id}', [ProsesTiController::class, 'destroy'])->name('proses_ti.destroy');
Route::get('proses_ti/get-domain/{id}', [ProsesTiController::class, 'getDomain'])->name('proses_ti.getDomain');
Route::get('proses_ti/get-klausul/{id}', [ProsesTiController::class, 'getKlausul'])->name('proses_ti.getKlausul');

// Rute untuk Klausul
use App\Http\Controllers\KlausulController;

Route::get('klausul', [KlausulController::class, 'index'])->name('klausul.index');
Route::get('klausul/create', [KlausulController::class, 'create'])->name('klausul.create');
Route::post('klausul', [KlausulController::class, 'store'])->name('klausul.store');

// AJAX endpoint untuk ambil level berdasarkan klausul
use App\Http\Controllers\ProjectController;
Route::post('project/get-levels-by-klausul', [ProjectController::class, 'getLevelsByKlausul'])->name('project.getLevelsByKlausul');
Route::get('klausul/{id}', [KlausulController::class, 'show'])->name('klausul.show');
Route::get('klausul/{id}/edit', [KlausulController::class, 'edit'])->name('klausul.edit');
Route::post('klausul/{id}', [KlausulController::class, 'update'])->name('klausul.update');
Route::delete('klausul/{id}', [KlausulController::class, 'destroy'])->name('klausul.destroy');
Route::get('klausul/json/{id}', [KlausulController::class, 'getKlausul'])->name('klausul.getKlausul');

use App\Http\Controllers\LevelController;
use App\Http\Controllers\QuestionController;

// Rute untuk Level
Route::get('level', [LevelController::class, 'index'])->name('level.index');
Route::get('level/create', [LevelController::class, 'create'])->name('level.create');
Route::post('level', [LevelController::class, 'store'])->name('level.store');
Route::get('level/{id}/edit', [LevelController::class, 'edit'])->name('level.edit');
Route::put('level/{id}', [LevelController::class, 'update'])->name('level.update');
Route::delete('level/{id}', [LevelController::class, 'destroy'])->name('level.destroy');

// Rute untuk Question
Route::get('question', [QuestionController::class, 'index'])->name('question.index');
Route::get('question/create', [QuestionController::class, 'create'])->name('question.create');
Route::post('question', [QuestionController::class, 'store'])->name('question.store');
Route::get('question/{id}/edit', [QuestionController::class, 'edit'])->name('question.edit');
Route::put('question/{id}', [QuestionController::class, 'update'])->name('question.update');
Route::delete('question/{id}', [QuestionController::class, 'destroy'])->name('question.destroy');



// Rute untuk Project
Route::get('project', [ProjectController::class, 'index'])->name('project.index');
Route::get('project/create', [ProjectController::class, 'create'])->name('project.create');
Route::post('project', [ProjectController::class, 'store'])->name('project.store');
Route::get('project/{id}/audit', [ProjectController::class, 'audit'])->name('project.audit');
Route::post('project/{id}/audit', [ProjectController::class, 'saveAudit'])->name('project.saveAudit');
Route::get('project/{id}/audit/{level_id}', [ProjectController::class, 'auditLevel'])->name('project.auditLevel');
Route::post('project/{id}/audit/{level_id}', [ProjectController::class, 'saveAuditLevel'])->name('project.saveAuditLevel');
Route::get('project/{id}', [ProjectController::class, 'show'])->name('project.show');
Route::get('project/{id}/edit', [ProjectController::class, 'edit'])->name('project.edit');
Route::post('project/{id}', [ProjectController::class, 'update'])->name('project.update');
Route::delete('project/{id}', [ProjectController::class, 'destroy'])->name('project.destroy');
Route::get('project/{id}/levels', [ProjectController::class, 'levelList'])->name('project.levelList');
Route::get('project/{id}/download-pdf', [ProjectController::class, 'downloadPdf'])->name('project.downloadPdf');
