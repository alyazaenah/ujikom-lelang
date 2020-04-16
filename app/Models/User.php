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
 * Class User
 *
 * @property int $id
 * @property string $name
 * @property string $username
 * @property string $password
 * @property string $no_telp
 * @property string $remember_token
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @property Collection|Barang[] $barangs
 * @property Collection|Penawaran[] $penawarans
 *
 * @package App\Models
 */
class User extends Authenticatable
{
    use Notifiable;

	protected $guard = 'web';
	protected $table = 'users';

	protected $hidden = [
		'password',
		'remember_token'
	];

	protected $fillable = [
		'name',
		'username',
		'password',
		'no_telp',
		'remember_token'
	];

	public function barangs()
	{
		return $this->hasMany(Barang::class);
	}

	public function penawarans()
	{
		return $this->hasMany(Penawaran::class);
	}
}
