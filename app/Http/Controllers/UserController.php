<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Show the profile for a given user.
     *
     * @param int $id
     * @return View
     */
    public function show(int $id): View
    {
        $data = [
            'user' => (new User)->findOrFail($id)
        ];
        return view('profile', $data);
    }
}
