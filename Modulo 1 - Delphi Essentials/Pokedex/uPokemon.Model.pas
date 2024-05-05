unit uPokemon.Model;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAbility = class;
  TAnimated = class;
  TBlackWhite = class;
  TCrystal = class;
  TDiamondPearl = class;
  TDreamWorld = class;
  TEmerald = class;
  TFireredLeafgreen = class;
  TGenerationI = class;
  TGenerationIi = class;
  TGenerationIii = class;
  TGenerationIv = class;
  TGenerationV = class;
  TGenerationVi = class;
  TGenerationVii = class;
  TGenerationViii = class;
  TGold = class;
  THeartgoldSoulsilver = class;
  THome = class;
  TIcons = class;
  TItem = class;
  TMove = class;
  TMoveLearnMethod = class;
  TOfficialArtwork = class;
  TOmegarubyAlphasapphire = class;
  TOther = class;
  TPlatinum = class;
  TRedBlue = class;
  TRubySapphire = class;
  TShowdown = class;
  TSilver = class;
  TStat = class;
  TType = class;
  TUltraSunUltraMoon = class;
  TVersion = class;
  TVersionDetails = class;
  TVersionGroup = class;
  TVersionGroupDetails = class;
  TVersions = class;
  TXY = class;
  TYellow = class;

  TType = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TTypes = class
  private
    [JSONName('slot')]
    FSlot: Integer;
    [JSONName('type')]
    FType: TType;
  published
    property Slot: Integer read FSlot write FSlot;
    property &Type: TType read FType;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TStat = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TStats = class
  private
    [JSONName('base_stat')]
    FBaseStat: Integer;
    [JSONName('effort')]
    FEffort: Integer;
    [JSONName('stat')]
    FStat: TStat;
  published
    property BaseStat: Integer read FBaseStat write FBaseStat;
    property Effort: Integer read FEffort write FEffort;
    property Stat: TStat read FStat;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TIcons = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
  end;

  TGenerationViii = class
  private
    [JSONName('icons')]
    FIcons: TIcons;
  published
    property Icons: TIcons read FIcons;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TUltraSunUltraMoon = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TGenerationVii = class
  private
    [JSONName('icons')]
    FIcons: TIcons;
    [JSONName('ultra-sun-ultra-moon')]
    FUltraSunUltraMoon: TUltraSunUltraMoon;
  published
    property Icons: TIcons read FIcons;
    property UltraSunUltraMoon: TUltraSunUltraMoon read FUltraSunUltraMoon;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TXY = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TOmegarubyAlphasapphire = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TGenerationVi = class
  private
    [JSONName('omegaruby-alphasapphire')]
    FOmegarubyAlphasapphire: TOmegarubyAlphasapphire;
    [JSONName('x-y')]
    FXY: TXY;
  published
    property OmegarubyAlphasapphire: TOmegarubyAlphasapphire read FOmegarubyAlphasapphire;
    property XY: TXY read FXY;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TAnimated = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TBlackWhite = class
  private
    [JSONName('animated')]
    FAnimated: TAnimated;
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property Animated: TAnimated read FAnimated;
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TGenerationV = class
  private
    [JSONName('black-white')]
    FBlackWhite: TBlackWhite;
  published
    property BlackWhite: TBlackWhite read FBlackWhite;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TPlatinum = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  THeartgoldSoulsilver = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TDiamondPearl = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TGenerationIv = class
  private
    [JSONName('diamond-pearl')]
    FDiamondPearl: TDiamondPearl;
    [JSONName('heartgold-soulsilver')]
    FHeartgoldSoulsilver: THeartgoldSoulsilver;
    [JSONName('platinum')]
    FPlatinum: TPlatinum;
  published
    property DiamondPearl: TDiamondPearl read FDiamondPearl;
    property HeartgoldSoulsilver: THeartgoldSoulsilver read FHeartgoldSoulsilver;
    property Platinum: TPlatinum read FPlatinum;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TRubySapphire = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TFireredLeafgreen = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TEmerald = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TGenerationIii = class
  private
    [JSONName('emerald')]
    FEmerald: TEmerald;
    [JSONName('firered-leafgreen')]
    FFireredLeafgreen: TFireredLeafgreen;
    [JSONName('ruby-sapphire')]
    FRubySapphire: TRubySapphire;
  published
    property Emerald: TEmerald read FEmerald;
    property FireredLeafgreen: TFireredLeafgreen read FFireredLeafgreen;
    property RubySapphire: TRubySapphire read FRubySapphire;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TSilver = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
    [JSONName('front_transparent')]
    FFrontTransparent: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
    property FrontTransparent: string read FFrontTransparent write FFrontTransparent;
  end;

  TGold = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
    [JSONName('front_transparent')]
    FFrontTransparent: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
    property FrontTransparent: string read FFrontTransparent write FFrontTransparent;
  end;

  TCrystal = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('back_shiny_transparent')]
    FBackShinyTransparent: string;
    [JSONName('back_transparent')]
    FBackTransparent: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
    [JSONName('front_shiny_transparent')]
    FFrontShinyTransparent: string;
    [JSONName('front_transparent')]
    FFrontTransparent: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property BackShinyTransparent: string read FBackShinyTransparent write FBackShinyTransparent;
    property BackTransparent: string read FBackTransparent write FBackTransparent;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
    property FrontShinyTransparent: string read FFrontShinyTransparent write FFrontShinyTransparent;
    property FrontTransparent: string read FFrontTransparent write FFrontTransparent;
  end;

  TGenerationIi = class
  private
    [JSONName('crystal')]
    FCrystal: TCrystal;
    [JSONName('gold')]
    FGold: TGold;
    [JSONName('silver')]
    FSilver: TSilver;
  published
    property Crystal: TCrystal read FCrystal;
    property Gold: TGold read FGold;
    property Silver: TSilver read FSilver;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TYellow = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_gray')]
    FBackGray: string;
    [JSONName('back_transparent')]
    FBackTransparent: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_gray')]
    FFrontGray: string;
    [JSONName('front_transparent')]
    FFrontTransparent: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackGray: string read FBackGray write FBackGray;
    property BackTransparent: string read FBackTransparent write FBackTransparent;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontGray: string read FFrontGray write FFrontGray;
    property FrontTransparent: string read FFrontTransparent write FFrontTransparent;
  end;

  TRedBlue = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_gray')]
    FBackGray: string;
    [JSONName('back_transparent')]
    FBackTransparent: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_gray')]
    FFrontGray: string;
    [JSONName('front_transparent')]
    FFrontTransparent: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackGray: string read FBackGray write FBackGray;
    property BackTransparent: string read FBackTransparent write FBackTransparent;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontGray: string read FFrontGray write FFrontGray;
    property FrontTransparent: string read FFrontTransparent write FFrontTransparent;
  end;

  TGenerationI = class
  private
    [JSONName('red-blue')]
    FRedBlue: TRedBlue;
    [JSONName('yellow')]
    FYellow: TYellow;
  published
    property RedBlue: TRedBlue read FRedBlue;
    property Yellow: TYellow read FYellow;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TVersions = class
  private
    [JSONName('generation-i')]
    FGenerationI: TGenerationI;
    [JSONName('generation-ii')]
    FGenerationIi: TGenerationIi;
    [JSONName('generation-iii')]
    FGenerationIii: TGenerationIii;
    [JSONName('generation-iv')]
    FGenerationIv: TGenerationIv;
    [JSONName('generation-v')]
    FGenerationV: TGenerationV;
    [JSONName('generation-vi')]
    FGenerationVi: TGenerationVi;
    [JSONName('generation-vii')]
    FGenerationVii: TGenerationVii;
    [JSONName('generation-viii')]
    FGenerationViii: TGenerationViii;
  published
    property GenerationI: TGenerationI read FGenerationI;
    property GenerationIi: TGenerationIi read FGenerationIi;
    property GenerationIii: TGenerationIii read FGenerationIii;
    property GenerationIv: TGenerationIv read FGenerationIv;
    property GenerationV: TGenerationV read FGenerationV;
    property GenerationVi: TGenerationVi read FGenerationVi;
    property GenerationVii: TGenerationVii read FGenerationVii;
    property GenerationViii: TGenerationViii read FGenerationViii;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TShowdown = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TOfficialArtwork = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  THome = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
  end;

  TDreamWorld = class
  private
    [JSONName('front_default')]
    FFrontDefault: string;
  published
    property FrontDefault: string read FFrontDefault write FFrontDefault;
  end;

  TOther = class
  private
    [JSONName('dream_world')]
    FDreamWorld: TDreamWorld;
    [JSONName('home')]
    FHome: THome;
    [JSONName('official-artwork')]
    FOfficialArtwork: TOfficialArtwork;
    [JSONName('showdown')]
    FShowdown: TShowdown;
  published
    property DreamWorld: TDreamWorld read FDreamWorld;
    property Home: THome read FHome;
    property OfficialArtwork: TOfficialArtwork read FOfficialArtwork;
    property Showdown: TShowdown read FShowdown;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TSprites = class
  private
    [JSONName('back_default')]
    FBackDefault: string;
    [JSONName('back_shiny')]
    FBackShiny: string;
    [JSONName('front_default')]
    FFrontDefault: string;
    [JSONName('front_shiny')]
    FFrontShiny: string;
    [JSONName('other')]
    FOther: TOther;
    [JSONName('versions')]
    FVersions: TVersions;
  published
    property BackDefault: string read FBackDefault write FBackDefault;
    property BackShiny: string read FBackShiny write FBackShiny;
    property FrontDefault: string read FFrontDefault write FFrontDefault;
    property FrontShiny: string read FFrontShiny write FFrontShiny;
    property Other: TOther read FOther;
    property Versions: TVersions read FVersions;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TSpecies = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TPastTypes = class
  end;

  TPastAbilities = class
  end;

  TVersionGroup = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TMoveLearnMethod = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TVersionGroupDetails = class
  private
    [JSONName('level_learned_at')]
    FLevelLearnedAt: Integer;
    [JSONName('move_learn_method')]
    FMoveLearnMethod: TMoveLearnMethod;
    [JSONName('version_group')]
    FVersionGroup: TVersionGroup;
  published
    property LevelLearnedAt: Integer read FLevelLearnedAt write FLevelLearnedAt;
    property MoveLearnMethod: TMoveLearnMethod read FMoveLearnMethod;
    property VersionGroup: TVersionGroup read FVersionGroup;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TMove = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TMoves = class(TJsonDTO)
  private
    [JSONName('move')]
    FMove: TMove;
    [JSONName('version_group_details'), JSONMarshalled(False)]
    FVersionGroupDetailsArray: TArray<TVersionGroupDetails>;
    [GenericListReflect]
    FVersionGroupDetails: TObjectList<TVersionGroupDetails>;
    function GetVersionGroupDetails: TObjectList<TVersionGroupDetails>;
  protected
    function GetAsJson: string; override;
  published
    property Move: TMove read FMove;
    property VersionGroupDetails: TObjectList<TVersionGroupDetails> read GetVersionGroupDetails;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TVersion = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TVersionDetails = class
  private
    [JSONName('rarity')]
    FRarity: Integer;
    [JSONName('version')]
    FVersion: TVersion;
  published
    property Rarity: Integer read FRarity write FRarity;
    property Version: TVersion read FVersion;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TItem = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  THeldItems = class(TJsonDTO)
  private
    [JSONName('item')]
    FItem: TItem;
    [JSONName('version_details'), JSONMarshalled(False)]
    FVersionDetailsArray: TArray<TVersionDetails>;
    [GenericListReflect]
    FVersionDetails: TObjectList<TVersionDetails>;
    function GetVersionDetails: TObjectList<TVersionDetails>;
  protected
    function GetAsJson: string; override;
  published
    property Item: TItem read FItem;
    property VersionDetails: TObjectList<TVersionDetails> read GetVersionDetails;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TGameIndices = class
  private
    [JSONName('game_index')]
    FGameIndex: Integer;
    [JSONName('version')]
    FVersion: TVersion;
  published
    property GameIndex: Integer read FGameIndex write FGameIndex;
    property Version: TVersion read FVersion;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TForms = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TCries = class
  private
    [JSONName('latest')]
    FLaTest: string;
    [JSONName('legacy')]
    FLegacy: string;
  published
    property LaTest: string read FLaTest write FLaTest;
    property Legacy: string read FLegacy write FLegacy;
  end;

  TAbility = class
  private
    [JSONName('name')]
    FName: string;
    [JSONName('url')]
    FUrl: string;
  published
    property Name: string read FName write FName;
    property Url: string read FUrl write FUrl;
  end;

  TAbilities = class
  private
    [JSONName('ability')]
    FAbility: TAbility;
    [JSONName('is_hidden')]
    FIsHidden: Boolean;
    [JSONName('slot')]
    FSlot: Integer;
  published
    property Ability: TAbility read FAbility;
    property IsHidden: Boolean read FIsHidden write FIsHidden;
    property Slot: Integer read FSlot write FSlot;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TPokemon = class(TJsonDTO)
  private
    [JSONName('abilities'), JSONMarshalled(False)]
    FAbilitiesArray: TArray<TAbilities>;
    [GenericListReflect]
    FAbilities: TObjectList<TAbilities>;
    [JSONName('base_experience')]
    FBaseExperience: Integer;
    [JSONName('cries')]
    FCries: TCries;
    [JSONName('forms'), JSONMarshalled(False)]
    FFormsArray: TArray<TForms>;
    [GenericListReflect]
    FForms: TObjectList<TForms>;
    [JSONName('game_indices'), JSONMarshalled(False)]
    FGameIndicesArray: TArray<TGameIndices>;
    [GenericListReflect]
    FGameIndices: TObjectList<TGameIndices>;
    [JSONName('height')]
    FHeight: Integer;
    [JSONName('held_items'), JSONMarshalled(False)]
    FHeldItemsArray: TArray<THeldItems>;
    [GenericListReflect]
    FHeldItems: TObjectList<THeldItems>;
    [JSONName('id')]
    FId: Integer;
    [JSONName('is_default')]
    FIsDefault: Boolean;
    [JSONName('location_area_encounters')]
    FLocationAreaEncounters: string;
    [JSONName('moves'), JSONMarshalled(False)]
    FMovesArray: TArray<TMoves>;
    [GenericListReflect]
    FMoves: TObjectList<TMoves>;
    [JSONName('name')]
    FName: string;
    [JSONName('order')]
    FOrder: Integer;
    [JSONName('past_abilities'), JSONMarshalled(False)]
    FPastAbilitiesArray: TArray<TPastAbilities>;
    [GenericListReflect]
    FPastAbilities: TObjectList<TPastAbilities>;
    [JSONName('past_types'), JSONMarshalled(False)]
    FPastTypesArray: TArray<TPastTypes>;
    [GenericListReflect]
    FPastTypes: TObjectList<TPastTypes>;
    [JSONName('species')]
    FSpecies: TSpecies;
    [JSONName('sprites')]
    FSprites: TSprites;
    [JSONName('stats'), JSONMarshalled(False)]
    FStatsArray: TArray<TStats>;
    [GenericListReflect]
    FStats: TObjectList<TStats>;
    [JSONName('types'), JSONMarshalled(False)]
    FTypesArray: TArray<TTypes>;
    [GenericListReflect]
    FTypes: TObjectList<TTypes>;
    [JSONName('weight')]
    FWeight: Integer;
    function GetAbilities: TObjectList<TAbilities>;
    function GetForms: TObjectList<TForms>;
    function GetGameIndices: TObjectList<TGameIndices>;
    function GetHeldItems: TObjectList<THeldItems>;
    function GetMoves: TObjectList<TMoves>;
    function GetPastAbilities: TObjectList<TPastAbilities>;
    function GetPastTypes: TObjectList<TPastTypes>;
    function GetStats: TObjectList<TStats>;
    function GetTypes: TObjectList<TTypes>;
  protected
    function GetAsJson: string; override;
  published
    property Abilities: TObjectList<TAbilities> read GetAbilities;
    property BaseExperience: Integer read FBaseExperience write FBaseExperience;
    property Cries: TCries read FCries;
    property Forms: TObjectList<TForms> read GetForms;
    property GameIndices: TObjectList<TGameIndices> read GetGameIndices;
    property Height: Integer read FHeight write FHeight;
    property HeldItems: TObjectList<THeldItems> read GetHeldItems;
    property Id: Integer read FId write FId;
    property IsDefault: Boolean read FIsDefault write FIsDefault;
    property LocationAreaEncounters: string read FLocationAreaEncounters write FLocationAreaEncounters;
    property Moves: TObjectList<TMoves> read GetMoves;
    property Name: string read FName write FName;
    property Order: Integer read FOrder write FOrder;
    property PastAbilities: TObjectList<TPastAbilities> read GetPastAbilities;
    property PastTypes: TObjectList<TPastTypes> read GetPastTypes;
    property Species: TSpecies read FSpecies;
    property Sprites: TSprites read FSprites;
    property Stats: TObjectList<TStats> read GetStats;
    property Types: TObjectList<TTypes> read GetTypes;
    property Weight: Integer read FWeight write FWeight;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TTypes }

constructor TTypes.Create;
begin
  inherited;
  FType := TType.Create;
end;

destructor TTypes.Destroy;
begin
  FType.Free;
  inherited;
end;

{ TStats }

constructor TStats.Create;
begin
  inherited;
  FStat := TStat.Create;
end;

destructor TStats.Destroy;
begin
  FStat.Free;
  inherited;
end;

{ TGenerationViii }

constructor TGenerationViii.Create;
begin
  inherited;
  FIcons := TIcons.Create;
end;

destructor TGenerationViii.Destroy;
begin
  FIcons.Free;
  inherited;
end;

{ TGenerationVii }

constructor TGenerationVii.Create;
begin
  inherited;
  FIcons := TIcons.Create;
  FUltraSunUltraMoon := TUltraSunUltraMoon.Create;
end;

destructor TGenerationVii.Destroy;
begin
  FIcons.Free;
  FUltraSunUltraMoon.Free;
  inherited;
end;

{ TGenerationVi }

constructor TGenerationVi.Create;
begin
  inherited;
  FOmegarubyAlphasapphire := TOmegarubyAlphasapphire.Create;
  FXY := TXY.Create;
end;

destructor TGenerationVi.Destroy;
begin
  FOmegarubyAlphasapphire.Free;
  FXY.Free;
  inherited;
end;

{ TBlackWhite }

constructor TBlackWhite.Create;
begin
  inherited;
  FAnimated := TAnimated.Create;
end;

destructor TBlackWhite.Destroy;
begin
  FAnimated.Free;
  inherited;
end;

{ TGenerationV }

constructor TGenerationV.Create;
begin
  inherited;
  FBlackWhite := TBlackWhite.Create;
end;

destructor TGenerationV.Destroy;
begin
  FBlackWhite.Free;
  inherited;
end;

{ TGenerationIv }

constructor TGenerationIv.Create;
begin
  inherited;
  FDiamondPearl := TDiamondPearl.Create;
  FHeartgoldSoulsilver := THeartgoldSoulsilver.Create;
  FPlatinum := TPlatinum.Create;
end;

destructor TGenerationIv.Destroy;
begin
  FDiamondPearl.Free;
  FHeartgoldSoulsilver.Free;
  FPlatinum.Free;
  inherited;
end;

{ TGenerationIii }

constructor TGenerationIii.Create;
begin
  inherited;
  FEmerald := TEmerald.Create;
  FFireredLeafgreen := TFireredLeafgreen.Create;
  FRubySapphire := TRubySapphire.Create;
end;

destructor TGenerationIii.Destroy;
begin
  FEmerald.Free;
  FFireredLeafgreen.Free;
  FRubySapphire.Free;
  inherited;
end;

{ TGenerationIi }

constructor TGenerationIi.Create;
begin
  inherited;
  FCrystal := TCrystal.Create;
  FGold := TGold.Create;
  FSilver := TSilver.Create;
end;

destructor TGenerationIi.Destroy;
begin
  FCrystal.Free;
  FGold.Free;
  FSilver.Free;
  inherited;
end;

{ TGenerationI }

constructor TGenerationI.Create;
begin
  inherited;
  FRedBlue := TRedBlue.Create;
  FYellow := TYellow.Create;
end;

destructor TGenerationI.Destroy;
begin
  FRedBlue.Free;
  FYellow.Free;
  inherited;
end;

{ TVersions }

constructor TVersions.Create;
begin
  inherited;
  FGenerationI := TGenerationI.Create;
  FGenerationIi := TGenerationIi.Create;
  FGenerationIii := TGenerationIii.Create;
  FGenerationIv := TGenerationIv.Create;
  FGenerationV := TGenerationV.Create;
  FGenerationVi := TGenerationVi.Create;
  FGenerationVii := TGenerationVii.Create;
  FGenerationViii := TGenerationViii.Create;
end;

destructor TVersions.Destroy;
begin
  FGenerationI.Free;
  FGenerationIi.Free;
  FGenerationIii.Free;
  FGenerationIv.Free;
  FGenerationV.Free;
  FGenerationVi.Free;
  FGenerationVii.Free;
  FGenerationViii.Free;
  inherited;
end;

{ TOther }

constructor TOther.Create;
begin
  inherited;
  FDreamWorld := TDreamWorld.Create;
  FHome := THome.Create;
  FOfficialArtwork := TOfficialArtwork.Create;
  FShowdown := TShowdown.Create;
end;

destructor TOther.Destroy;
begin
  FDreamWorld.Free;
  FHome.Free;
  FOfficialArtwork.Free;
  FShowdown.Free;
  inherited;
end;

{ TSprites }

constructor TSprites.Create;
begin
  inherited;
  FOther := TOther.Create;
  FVersions := TVersions.Create;
end;

destructor TSprites.Destroy;
begin
  FOther.Free;
  FVersions.Free;
  inherited;
end;

{ TVersionGroupDetails }

constructor TVersionGroupDetails.Create;
begin
  inherited;
  FMoveLearnMethod := TMoveLearnMethod.Create;
  FVersionGroup := TVersionGroup.Create;
end;

destructor TVersionGroupDetails.Destroy;
begin
  FMoveLearnMethod.Free;
  FVersionGroup.Free;
  inherited;
end;

{ TMoves }

constructor TMoves.Create;
begin
  inherited;
  FMove := TMove.Create;
end;

destructor TMoves.Destroy;
begin
  FMove.Free;
  GetVersionGroupDetails.Free;
  inherited;
end;

function TMoves.GetVersionGroupDetails: TObjectList<TVersionGroupDetails>;
begin
  Result := ObjectList<TVersionGroupDetails>(FVersionGroupDetails, FVersionGroupDetailsArray);
end;

function TMoves.GetAsJson: string;
begin
  RefreshArray<TVersionGroupDetails>(FVersionGroupDetails, FVersionGroupDetailsArray);
  Result := inherited;
end;

{ TVersionDetails }

constructor TVersionDetails.Create;
begin
  inherited;
  FVersion := TVersion.Create;
end;

destructor TVersionDetails.Destroy;
begin
  FVersion.Free;
  inherited;
end;

{ THeldItems }

constructor THeldItems.Create;
begin
  inherited;
  FItem := TItem.Create;
end;

destructor THeldItems.Destroy;
begin
  FItem.Free;
  GetVersionDetails.Free;
  inherited;
end;

function THeldItems.GetVersionDetails: TObjectList<TVersionDetails>;
begin
  Result := ObjectList<TVersionDetails>(FVersionDetails, FVersionDetailsArray);
end;

function THeldItems.GetAsJson: string;
begin
  RefreshArray<TVersionDetails>(FVersionDetails, FVersionDetailsArray);
  Result := inherited;
end;

{ TGameIndices }

constructor TGameIndices.Create;
begin
  inherited;
  FVersion := TVersion.Create;
end;

destructor TGameIndices.Destroy;
begin
  FVersion.Free;
  inherited;
end;

{ TAbilities }

constructor TAbilities.Create;
begin
  inherited;
  FAbility := TAbility.Create;
end;

destructor TAbilities.Destroy;
begin
  FAbility.Free;
  inherited;
end;

{ TRoot }

constructor TPokemon.Create;
begin
  inherited;
  FCries := TCries.Create;
  FSpecies := TSpecies.Create;
  FSprites := TSprites.Create;
end;

destructor TPokemon.Destroy;
begin
  FCries.Free;
  FSpecies.Free;
  FSprites.Free;
  GetAbilities.Free;
  GetForms.Free;
  GetGameIndices.Free;
  GetHeldItems.Free;
  GetMoves.Free;
  GetPastAbilities.Free;
  GetPastTypes.Free;
  GetStats.Free;
  GetTypes.Free;
  inherited;
end;

function TPokemon.GetAbilities: TObjectList<TAbilities>;
begin
  Result := ObjectList<TAbilities>(FAbilities, FAbilitiesArray);
end;

function TPokemon.GetForms: TObjectList<TForms>;
begin
  Result := ObjectList<TForms>(FForms, FFormsArray);
end;

function TPokemon.GetGameIndices: TObjectList<TGameIndices>;
begin
  Result := ObjectList<TGameIndices>(FGameIndices, FGameIndicesArray);
end;

function TPokemon.GetHeldItems: TObjectList<THeldItems>;
begin
  Result := ObjectList<THeldItems>(FHeldItems, FHeldItemsArray);
end;

function TPokemon.GetMoves: TObjectList<TMoves>;
begin
  Result := ObjectList<TMoves>(FMoves, FMovesArray);
end;

function TPokemon.GetPastAbilities: TObjectList<TPastAbilities>;
begin
  Result := ObjectList<TPastAbilities>(FPastAbilities, FPastAbilitiesArray);
end;

function TPokemon.GetPastTypes: TObjectList<TPastTypes>;
begin
  Result := ObjectList<TPastTypes>(FPastTypes, FPastTypesArray);
end;

function TPokemon.GetStats: TObjectList<TStats>;
begin
  Result := ObjectList<TStats>(FStats, FStatsArray);
end;

function TPokemon.GetTypes: TObjectList<TTypes>;
begin
  Result := ObjectList<TTypes>(FTypes, FTypesArray);
end;

function TPokemon.GetAsJson: string;
begin
  RefreshArray<TAbilities>(FAbilities, FAbilitiesArray);
  RefreshArray<TForms>(FForms, FFormsArray);
  RefreshArray<TGameIndices>(FGameIndices, FGameIndicesArray);
  RefreshArray<THeldItems>(FHeldItems, FHeldItemsArray);
  RefreshArray<TMoves>(FMoves, FMovesArray);
  RefreshArray<TPastAbilities>(FPastAbilities, FPastAbilitiesArray);
  RefreshArray<TPastTypes>(FPastTypes, FPastTypesArray);
  RefreshArray<TStats>(FStats, FStatsArray);
  RefreshArray<TTypes>(FTypes, FTypesArray);
  Result := inherited;
end;

end.
