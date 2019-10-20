{{-- token csrf pour se prévenir contre la faille d'authification web--}}
{{-- permet de vérifier que la personne qui fait les actions est authentifiée --}}

@csrf

{{-- @error('pseudo')is-invalid @enderror permet de mettre un visuel sur une erreur et avec le  class="invalid-feedback" nous permet de mettre un message personalisé--}}
<div class="form-group" >

<input type="text" class="form-control @error('name')is-invalid @enderror" name="name" placeholder="Entrez un nom ou pseudo" value="{{old('name') ?? $client->name }}">
    @error('name')
        <div class="invalid-feedback">
            Ce champ est requis !
        </div>
    @enderror
</div>
<div class="form-group">
    <input type="email" class="form-control @error('email')is-invalid @enderror" name="email" placeholder="Entrez un email"value="{{old('email') ?? $client->email }}">
    @error('email')
       <div class="invalid-feedback">
            Ce champ est requis !
       </div>
    @enderror
</div>
<div class="form-group">
    <select name="status" id="" class="costum-select @error('status')is-invalid @enderror">
        @foreach ($client->getStatusOptions()  as $key=>$value )
          <option value="{{$key}}"{{$client->status==$value ? 'selected' : ''}}>{{$value}}</option>  
        @endforeach
    </select>
    @error('status')
        <div class="invalid-feedback">
            Ce champ est requis !
</div>
@enderror
<div class="form-group">
    <select name="entreprise_id"  class="costum-select @error('entreprise_id')is-invalid @enderror">

        @foreach ( $entreprises as $entreprise )
            <option value="{{ $entreprise->id }}"{{$client->entreprise_id==$entreprise->id ? 'selected' :''}}>{{ $entreprise->name }}</option>
                
        @endforeach
                
    </select>
    @error('entreprise_id')
        <div class="invalid-feedback">
            Ce champ est requis !
    </div>
    @enderror
</div>
<div class="form-group">
    <div class="custom-file">
        <input type="file" name="image" class="custom-file-input @error('image')is-invalid @enderror"" id="validatedCustomFile" >
        <label class="custom-file-label" for="validatedCustomFile">Choisir une image...</label>
        <div class="invalid-feedback">Example invalid custom file feedback</div>
     </div>
</div>