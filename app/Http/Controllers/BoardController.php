<?php

namespace App\Http\Controllers;

use App\Models\Board;
use Illuminate\Http\Request;

class BoardController extends Controller
{
    public function indexApi()
    {
        $data = Board::all();
        return $this->sendResponse( $data, 'E Services retrieved successfully');

    }


}
