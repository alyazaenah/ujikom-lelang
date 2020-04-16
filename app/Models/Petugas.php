<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

/**
 * Class Petuga
 *
 * @property int $id
 * @property string $name
 * @property string $username
 * @property string $password
 * @property string $remember_token
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @property Collection|Lelang[] $lelangs
 *
 * @package App\Models
 */
class Petugas extends Authenticatable
{
    use Notifiable;

	protected $guard = 'petugas';
	protected $table = 'petugas';

	protected $hidden = [
		'password',
		'remember_token'
	];

	protected $fillable = [
		'name',
		'username',
		'password',
		'remember_token'
	];

	public function lelangs()
	{
		return $this->hasMany(Lelang::class, 'petugas_id');
	}
}
