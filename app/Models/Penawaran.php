<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Penawaran
 * 
 * @property int $id
 * @property int $user_id
 * @property int $nominal
 * @property int $barang_id
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property Barang $barang
 * @property User $user
 * @property Collection|Lelang[] $lelangs
 *
 * @package App\Models
 */
class Penawaran extends Model
{
	protected $table = 'penawaran';

	protected $casts = [
		'user_id' => 'int',
		'nominal' => 'int',
		'barang_id' => 'int'
	];

	protected $fillable = [
		'user_id',
		'nominal',
		'barang_id'
	];

	public function barang()
	{
		return $this->belongsTo(Barang::class);
	}

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function lelangs()
	{
		return $this->hasMany(Lelang::class);
	}
}
