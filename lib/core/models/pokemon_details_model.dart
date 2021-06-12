// To parse this JSON data, do
//
//     final pokemonDetailsModel = pokemonDetailsModelFromJson(jsonString);

import 'dart:convert';

PokemonDetailsModel pokemonDetailsModelFromJson(String str) =>
    PokemonDetailsModel.fromJson(json.decode(str));

String pokemonDetailsModelToJson(PokemonDetailsModel data) =>
    json.encode(data.toJson());

class PokemonDetailsModel {
  PokemonDetailsModel({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        abilities: json['abilities'] == null
            ? null
            : List<Ability>.from(
                json['abilities'].map((x) => Ability.fromJson(x))),
        baseExperience:
            json['base_experience'] == null ? null : json['base_experience'],
        forms: json['forms'] == null
            ? null
            : List<Species>.from(json['forms'].map((x) => Species.fromJson(x))),
        gameIndices: json['game_indices'] == null
            ? null
            : List<GameIndex>.from(
                json['game_indices'].map((x) => GameIndex.fromJson(x))),
        height: json['height'] == null ? null : json['height'],
        heldItems: json['held_items'] == null
            ? null
            : List<dynamic>.from(json['held_items'].map((x) => x)),
        id: json['id'] == null ? null : json['id'],
        isDefault: json['is_default'] == null ? null : json['is_default'],
        locationAreaEncounters: json['location_area_encounters'] == null
            ? null
            : json['location_area_encounters'],
        moves: json['moves'] == null
            ? null
            : List<Move>.from(json['moves'].map((x) => Move.fromJson(x))),
        name: json['name'] == null ? null : json['name'],
        order: json['order'] == null ? null : json['order'],
        pastTypes: json['past_types'] == null
            ? null
            : List<dynamic>.from(json['past_types'].map((x) => x)),
        species:
            json['species'] == null ? null : Species.fromJson(json['species']),
        sprites:
            json['sprites'] == null ? null : Sprites.fromJson(json['sprites']),
        stats: json['stats'] == null
            ? null
            : List<Stat>.from(json['stats'].map((x) => Stat.fromJson(x))),
        types: json['types'] == null
            ? null
            : List<Type>.from(json['types'].map((x) => Type.fromJson(x))),
        weight: json['weight'] == null ? null : json['weight'],
      );

  Map<String, dynamic> toJson() => {
        'abilities': abilities == null
            ? null
            : List<dynamic>.from(abilities.map((x) => x.toJson())),
        'base_experience': baseExperience == null ? null : baseExperience,
        'forms': forms == null
            ? null
            : List<dynamic>.from(forms.map((x) => x.toJson())),
        'game_indices': gameIndices == null
            ? null
            : List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        'height': height == null ? null : height,
        'held_items': heldItems == null
            ? null
            : List<dynamic>.from(heldItems.map((x) => x)),
        'id': id == null ? null : id,
        'is_default': isDefault == null ? null : isDefault,
        'location_area_encounters':
            locationAreaEncounters == null ? null : locationAreaEncounters,
        'moves': moves == null
            ? null
            : List<dynamic>.from(moves.map((x) => x.toJson())),
        'name': name == null ? null : name,
        'order': order == null ? null : order,
        'past_types': pastTypes == null
            ? null
            : List<dynamic>.from(pastTypes.map((x) => x)),
        'species': species == null ? null : species.toJson(),
        'sprites': sprites == null ? null : sprites.toJson(),
        'stats': stats == null
            ? null
            : List<dynamic>.from(stats.map((x) => x.toJson())),
        'types': types == null
            ? null
            : List<dynamic>.from(types.map((x) => x.toJson())),
        'weight': weight == null ? null : weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  final Species ability;
  final bool isHidden;
  final int slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability:
            json['ability'] == null ? null : Species.fromJson(json['ability']),
        isHidden: json['is_hidden'] == null ? null : json['is_hidden'],
        slot: json['slot'] == null ? null : json['slot'],
      );

  Map<String, dynamic> toJson() => {
        'ability': ability == null ? null : ability.toJson(),
        'is_hidden': isHidden == null ? null : isHidden,
        'slot': slot == null ? null : slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  final String name;
  final String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json['name'] == null ? null : json['name'],
        url: json['url'] == null ? null : json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name == null ? null : name,
        'url': url == null ? null : url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  final int gameIndex;
  final Species version;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json['game_index'] == null ? null : json['game_index'],
        version:
            json['version'] == null ? null : Species.fromJson(json['version']),
      );

  Map<String, dynamic> toJson() => {
        'game_index': gameIndex == null ? null : gameIndex,
        'version': version == null ? null : version.toJson(),
      };
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: json['move'] == null ? null : Species.fromJson(json['move']),
        versionGroupDetails: json['version_group_details'] == null
            ? null
            : List<VersionGroupDetail>.from(json['version_group_details']
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'move': move == null ? null : move.toJson(),
        'version_group_details': versionGroupDetails == null
            ? null
            : List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  final int levelLearnedAt;
  final Species moveLearnMethod;
  final Species versionGroup;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt:
            json['level_learned_at'] == null ? null : json['level_learned_at'],
        moveLearnMethod: json['move_learn_method'] == null
            ? null
            : Species.fromJson(json['move_learn_method']),
        versionGroup: json['version_group'] == null
            ? null
            : Species.fromJson(json['version_group']),
      );

  Map<String, dynamic> toJson() => {
        'level_learned_at': levelLearnedAt == null ? null : levelLearnedAt,
        'move_learn_method':
            moveLearnMethod == null ? null : moveLearnMethod.toJson(),
        'version_group': versionGroup == null ? null : versionGroup.toJson(),
      };
}

class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  final Sprites blackWhite;

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: json['black-white'] == null
            ? null
            : Sprites.fromJson(json['black-white']),
      );

  Map<String, dynamic> toJson() => {
        'black-white': blackWhite == null ? null : blackWhite.toJson(),
      };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  final Sprites diamondPearl;
  final Sprites heartgoldSoulsilver;
  final Sprites platinum;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json['diamond-pearl'] == null
            ? null
            : Sprites.fromJson(json['diamond-pearl']),
        heartgoldSoulsilver: json['heartgold-soulsilver'] == null
            ? null
            : Sprites.fromJson(json['heartgold-soulsilver']),
        platinum: json['platinum'] == null
            ? null
            : Sprites.fromJson(json['platinum']),
      );

  Map<String, dynamic> toJson() => {
        'diamond-pearl': diamondPearl == null ? null : diamondPearl.toJson(),
        'heartgold-soulsilver':
            heartgoldSoulsilver == null ? null : heartgoldSoulsilver.toJson(),
        'platinum': platinum == null ? null : platinum.toJson(),
      };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final Map<String, GenerationVi> generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: json['generation-i'] == null
            ? null
            : GenerationI.fromJson(json['generation-i']),
        generationIi: json['generation-ii'] == null
            ? null
            : GenerationIi.fromJson(json['generation-ii']),
        generationIii: json['generation-iii'] == null
            ? null
            : GenerationIii.fromJson(json['generation-iii']),
        generationIv: json['generation-iv'] == null
            ? null
            : GenerationIv.fromJson(json['generation-iv']),
        generationV: json['generation-v'] == null
            ? null
            : GenerationV.fromJson(json['generation-v']),
        generationVi: json['generation-vi'] == null
            ? null
            : Map.from(json['generation-vi']).map((k, v) =>
                MapEntry<String, GenerationVi>(k, GenerationVi.fromJson(v))),
        generationVii: json['generation-vii'] == null
            ? null
            : GenerationVii.fromJson(json['generation-vii']),
        generationViii: json['generation-viii'] == null
            ? null
            : GenerationViii.fromJson(json['generation-viii']),
      );

  Map<String, dynamic> toJson() => {
        'generation-i': generationI == null ? null : generationI.toJson(),
        'generation-ii': generationIi == null ? null : generationIi.toJson(),
        'generation-iii': generationIii == null ? null : generationIii.toJson(),
        'generation-iv': generationIv == null ? null : generationIv.toJson(),
        'generation-v': generationV == null ? null : generationV.toJson(),
        'generation-vi': generationVi == null
            ? null
            : Map.from(generationVi)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        'generation-vii': generationVii == null ? null : generationVii.toJson(),
        'generation-viii':
            generationViii == null ? null : generationViii.toJson(),
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final Other other;
  final Versions versions;
  final Sprites animated;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json['back_default'] == null ? null : json['back_default'],
        backFemale: json['back_female'],
        backShiny: json['back_shiny'] == null ? null : json['back_shiny'],
        backShinyFemale: json['back_shiny_female'],
        frontDefault:
            json['front_default'] == null ? null : json['front_default'],
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'] == null ? null : json['front_shiny'],
        frontShinyFemale: json['front_shiny_female'],
        other: json['other'] == null ? null : Other.fromJson(json['other']),
        versions: json['versions'] == null
            ? null
            : Versions.fromJson(json['versions']),
        animated: json['animated'] == null
            ? null
            : Sprites.fromJson(json['animated']),
      );

  Map<String, dynamic> toJson() => {
        'back_default': backDefault == null ? null : backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny == null ? null : backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault == null ? null : frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny == null ? null : frontShiny,
        'front_shiny_female': frontShinyFemale,
        'other': other == null ? null : other.toJson(),
        'versions': versions == null ? null : versions.toJson(),
        'animated': animated == null ? null : animated.toJson(),
      };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  final RedBlue redBlue;
  final RedBlue yellow;

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: json['red-blue'] == null
            ? null
            : RedBlue.fromJson(json['red-blue']),
        yellow:
            json['yellow'] == null ? null : RedBlue.fromJson(json['yellow']),
      );

  Map<String, dynamic> toJson() => {
        'red-blue': redBlue == null ? null : redBlue.toJson(),
        'yellow': yellow == null ? null : yellow.toJson(),
      };
}

class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.frontDefault,
    this.frontGray,
  });

  final String backDefault;
  final String backGray;
  final String frontDefault;
  final String frontGray;

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json['back_default'] == null ? null : json['back_default'],
        backGray: json['back_gray'] == null ? null : json['back_gray'],
        frontDefault:
            json['front_default'] == null ? null : json['front_default'],
        frontGray: json['front_gray'] == null ? null : json['front_gray'],
      );

  Map<String, dynamic> toJson() => {
        'back_default': backDefault == null ? null : backDefault,
        'back_gray': backGray == null ? null : backGray,
        'front_default': frontDefault == null ? null : frontDefault,
        'front_gray': frontGray == null ? null : frontGray,
      };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  final Crystal crystal;
  final Crystal gold;
  final Crystal silver;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal:
            json['crystal'] == null ? null : Crystal.fromJson(json['crystal']),
        gold: json['gold'] == null ? null : Crystal.fromJson(json['gold']),
        silver:
            json['silver'] == null ? null : Crystal.fromJson(json['silver']),
      );

  Map<String, dynamic> toJson() => {
        'crystal': crystal == null ? null : crystal.toJson(),
        'gold': gold == null ? null : gold.toJson(),
        'silver': silver == null ? null : silver.toJson(),
      };
}

class Crystal {
  Crystal({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json['back_default'] == null ? null : json['back_default'],
        backShiny: json['back_shiny'] == null ? null : json['back_shiny'],
        frontDefault:
            json['front_default'] == null ? null : json['front_default'],
        frontShiny: json['front_shiny'] == null ? null : json['front_shiny'],
      );

  Map<String, dynamic> toJson() => {
        'back_default': backDefault == null ? null : backDefault,
        'back_shiny': backShiny == null ? null : backShiny,
        'front_default': frontDefault == null ? null : frontDefault,
        'front_shiny': frontShiny == null ? null : frontShiny,
      };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  final Emerald emerald;
  final Crystal fireredLeafgreen;
  final Crystal rubySapphire;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald:
            json['emerald'] == null ? null : Emerald.fromJson(json['emerald']),
        fireredLeafgreen: json['firered-leafgreen'] == null
            ? null
            : Crystal.fromJson(json['firered-leafgreen']),
        rubySapphire: json['ruby-sapphire'] == null
            ? null
            : Crystal.fromJson(json['ruby-sapphire']),
      );

  Map<String, dynamic> toJson() => {
        'emerald': emerald == null ? null : emerald.toJson(),
        'firered-leafgreen':
            fireredLeafgreen == null ? null : fireredLeafgreen.toJson(),
        'ruby-sapphire': rubySapphire == null ? null : rubySapphire.toJson(),
      };
}

class Emerald {
  Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  final String frontDefault;
  final String frontShiny;

  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault:
            json['front_default'] == null ? null : json['front_default'],
        frontShiny: json['front_shiny'] == null ? null : json['front_shiny'],
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault == null ? null : frontDefault,
        'front_shiny': frontShiny == null ? null : frontShiny,
      };
}

class GenerationVi {
  GenerationVi({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  factory GenerationVi.fromJson(Map<String, dynamic> json) => GenerationVi(
        frontDefault:
            json['front_default'] == null ? null : json['front_default'],
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'] == null ? null : json['front_shiny'],
        frontShinyFemale: json['front_shiny_female'],
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault == null ? null : frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny == null ? null : frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  final DreamWorld icons;
  final GenerationVi ultraSunUltraMoon;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons:
            json['icons'] == null ? null : DreamWorld.fromJson(json['icons']),
        ultraSunUltraMoon: json['ultra-sun-ultra-moon'] == null
            ? null
            : GenerationVi.fromJson(json['ultra-sun-ultra-moon']),
      );

  Map<String, dynamic> toJson() => {
        'icons': icons == null ? null : icons.toJson(),
        'ultra-sun-ultra-moon':
            ultraSunUltraMoon == null ? null : ultraSunUltraMoon.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  final String frontDefault;
  final dynamic frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault:
            json['front_default'] == null ? null : json['front_default'],
        frontFemale: json['front_female'],
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault == null ? null : frontDefault,
        'front_female': frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });

  final DreamWorld icons;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons:
            json['icons'] == null ? null : DreamWorld.fromJson(json['icons']),
      );

  Map<String, dynamic> toJson() => {
        'icons': icons == null ? null : icons.toJson(),
      };
}

class Other {
  Other({
    this.dreamWorld,
    this.officialArtwork,
  });

  final DreamWorld dreamWorld;
  final OfficialArtwork officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: json['dream_world'] == null
            ? null
            : DreamWorld.fromJson(json['dream_world']),
        officialArtwork: json['official-artwork'] == null
            ? null
            : OfficialArtwork.fromJson(json['official-artwork']),
      );

  Map<String, dynamic> toJson() => {
        'dream_world': dreamWorld == null ? null : dreamWorld.toJson(),
        'official-artwork':
            officialArtwork == null ? null : officialArtwork.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  final String frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault:
            json['front_default'] == null ? null : json['front_default'],
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault == null ? null : frontDefault,
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  final int baseStat;
  final int effort;
  final Species stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'] == null ? null : json['base_stat'],
        effort: json['effort'] == null ? null : json['effort'],
        stat: json['stat'] == null ? null : Species.fromJson(json['stat']),
      );

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat == null ? null : baseStat,
        'effort': effort == null ? null : effort,
        'stat': stat == null ? null : stat.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  final int slot;
  final Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'] == null ? null : json['slot'],
        type: json['type'] == null ? null : Species.fromJson(json['type']),
      );

  Map<String, dynamic> toJson() => {
        'slot': slot == null ? null : slot,
        'type': type == null ? null : type.toJson(),
      };
}
