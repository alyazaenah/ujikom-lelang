<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::middleware('auth')->group(function () {
    Route::get('/home', 'HomeController@index')->name('home');
    Route::post('/user/logout', 'Auth\LoginController@logoutUser')->name('user.logout');
});



Route::group(['prefix' => 'admin'], function($route) {
    Route::get('/login', 'AuthAdmin\LoginController@showLoginForm')->name('admin.login');
    Route::get('/register', 'AuthAdmin\RegisterController@showRegisterForm')->name('admin.register');
    Route::post('/register', 'AuthAdmin\RegisterController@create')->name('admin.register.submit');
    Route::post('/login', 'AuthAdmin\LoginController@login')->name('admin.login.submit');
        Route::middleware('auth:admin')->group(function () {
            Route::get('/', 'AdminController@index')->name('admin.home');
            Route::post('/logout', 'AuthAdmin\LoginController@logoutAdmin')->name('admin.logout');
     });
    
});

Route::group(['prefix' => 'petugas'], function($route) {
    Route::get('/login', 'AuthPetugas\LoginController@showLoginForm')->name('petugas.login');
    Route::get('/register', 'AuthPetugas\RegisterController@showRegisterForm')->name('petugas.register');
    Route::post('/register', 'AuthPetugas\RegisterController@create')->name('petugas.register.submit');
    Route::post('/login', 'AuthPetugas\LoginController@login')->name('petugas.login.submit');
        Route::middleware('auth:petugas')->group(function () {
            Route::get('/', 'PetugasController@index')->name('petugas.home');
            Route::post('/logout', 'AuthPetugas\LoginController@logoutPetugas')->name('petugas.logout');
     });
    
});



