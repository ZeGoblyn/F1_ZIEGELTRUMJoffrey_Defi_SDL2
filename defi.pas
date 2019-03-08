program DefiSDL2;
{$UNITPATH \SDL2}

uses SDL2, SDL2_image;

//SDL et SDL 2.0: Language de programmation d�velopper pour g�rer les visuel 2D et 3D.
//La diff�rence entre les deux version du programme repose majoritairement sur les possibilit�es offertes
//par le code, plus nombreuses sur SDL2, et sur les programmes d'exploitoitation sur lequel le code peu
//fonctionner.

var
  sdlWindow1: PSDL_Window;
  sdlRenderer: PSDL_Renderer;
  sdlSurface1: PSDL_Surface;
  sdlSurface2: PSDL_Surface;
  sdlTexture1: PSDL_Texture;
  sdlTexture2: PSDL_Texture;
  sdlRendu: TSDL_Rect;
  sdlFrame: TSDL_Rect;
  sdlRider: TSDL_Rect;
  sdlEvent: PSDL_Event;
  sdlKeyboardState: PUInt8;
  exit: boolean = false;

begin
 	if SDL_Init(SDL_INIT_VIDEO) < 0 then Halt(1);

        sdlWindow1:=SDL_CreateWindow('SDL',50,50,600,600,SDL_WINDOW_SHOWN); //Cr�ation de la fen�tre du programme.

        sdlRenderer:=SDL_CreateRenderer(sdlWindow1,-1,SDL_RENDERER_SOFTWARE);  //Mise en place de l'affichage dans la fen�tre.

	SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'nearest'); //D�finition de la qualit� d'image

	sdlRendu.x := 25;   //Cr�ation du rectangle contenant l'image anim�e.
  	sdlRendu.y := 50;
  	sdlRendu.w := 128;
  	sdlRendu.h := 55;

        sdlRider.x := 270;  //Cr�ation du rectangle contenant le Bitmap.
        sdlRider.y := 270;
        sdlRider.w := 60;
        sdlRider.h := 60;

        sdlSurface1:=IMG_Load('Assets\helicopter.png');   //Importation d'une image et cr�ation d'une surface.
        if sdlTexture1 = nil then

  	sdlTexture1 := SDL_CreateTextureFromSurface(sdlRenderer, sdlSurface1);   //Convertion de la Surface en Texture.
  	if sdlTexture1 = nil then;

        sdlSurface2:=SDL_LoadBMP('Assets\rider.bmp');
        if sdlSurface2 = nil then;

        sdlTexture2:=SDL_CreateTextureFromSurface(sdlRenderer, sdlSurface2);
        if sdlTexture2 = nil then;

  	sdlFrame.x:= 0;          //Mise en place du rectangle servant � "scaner" la texture.
  	sdlFrame.y:= 0;
  	sdlFrame.w:= 128;
  	sdlFrame.h := 55;


  	SDL_RenderPresent(sdlRenderer);    //Affichage des informations sur l'�cran.

  	writeln;

  	while exit = false do
    begin
      	SDL_PumpEvents;
    	sdlKeyboardState := SDL_GetKeyboardState(nil);

    	// Sortit du programme vie Esc.
   		if sdlKeyboardState[SDL_SCANCODE_ESCAPE] = 1 then
      	exit := TRUE;

	    // Mise en place des mouvements par ZQSD.
	    if sdlKeyboardState[SDL_SCANCODE_W] = 1 then
	      sdlRendu.y := sdlRendu.y-1;
	    if sdlKeyboardState[SDL_SCANCODE_A] = 1 then
	      sdlRendu.x := sdlRendu.x-1;
	    if sdlKeyboardState[SDL_SCANCODE_S] = 1 then
	      sdlRendu.y := sdlRendu.y+1;
	    if sdlKeyboardState[SDL_SCANCODE_D] = 1 then
	      sdlRendu.x := sdlRendu.x+1;



        sdlFrame.x:= sdlFrame.x+128;   //D�placement du rectangle "scaner" sur l'image afin d'alterner les Frame du mod�le.
        if sdlFrame.x > 512 then
        begin
        sdlFrame.x:= 0;
        end;
        SDL_RenderCopy(sdlRenderer, sdlTexture2, nil, @sdlRider);     //Renvoi l'image du Bitmap.
        SDL_RenderCopy(sdlRenderer, sdlTexture1, @sdlFrame, @sdlRendu);  //Renvoi l'image capturer par le rectangle "scaner" au rectangle afficher � l'�cran.
        SDL_SetRenderDrawColor(sdlRenderer, 255, 0, 0, 255 );
        SDL_RenderDrawLine(sdlRenderer, 0, 0, 600, 600 );
        SDL_RenderDrawLine(sdlRenderer, 600, 0, 0, 600 );
        SDL_SetRenderDrawColor(sdlRenderer, 0, 0, 0, 255 );
        SDL_RenderPresent(sdlRenderer);
        SDL_Delay (20);
        SDL_RenderClear(sdlRenderer);
  	end;

  	SDL_DestroyTexture(sdlTexture1); //Destruction des �l�ments pour fermeture viable du programme.
        SDL_DestroyTexture(sdlTexture2);
  	SDL_FreeSurface(sdlSurface1);
        SDL_FreeSurface(sdlSurface2);
  	SDL_DestroyRenderer(sdlRenderer);
  	SDL_DestroyWindow (sdlWindow1);

  	SDL_Quit;

end.
