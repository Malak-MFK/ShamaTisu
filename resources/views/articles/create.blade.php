@extends('articles')

@section('content')
@php
    $state = session('state')
@endphp

<div class="container justify-content-center my-5">
    @if ($state)
        <div class="alert alert-danger">
            Réessayer ultérieurement
        </div>
    @endif
        
        <form class="p-4 col-md-8 mx-5 p-5" method="POST" action="{{route('articles.store')}}" enctype="multipart/form-data">
            @csrf
            <div class="form-group col-md-6">
                <label >Libelle</label>
                <input type="text" name="Libelle" class="form-control" required placeholder="Libelle...">
            </div>
            
            <div class="form-group col-md-6">
                <label >Prix</label>
                <input type="number" name="Prix" class="form-control" required placeholder="Prix...">
            </div>
            <br>
            <div class="mb-3 col-md-6">
                <label for="formFile" class="form-label">Default file input example</label>
                <input class="form-control" type="file" id="formFile" name="Image">
            </div>
            
            <div class="col-md-8 justify-content-center">
                <button type="submit" class="btn btn-primary col-md-4">Ajouter Produit</button>
            </div>
    </form>
</div>
@endsection
