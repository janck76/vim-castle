setlocal tabstop=2
setlocal shiftwidth=2


" if @% =~ '.*Spec\.js$'
if @% =~ '.*Spec\(\.e2e\)\?\.js$'
   UltiSnipsAddFiletypes javascript-jasmine 
endif
