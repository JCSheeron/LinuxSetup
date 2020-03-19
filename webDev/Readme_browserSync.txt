Browser sync installed locally via npm:
    npm install browser-sync --save-dev

If you want to use the browser-sync module from a local install you will have to prepend the full path to the browser-sync binary from within your .bin directory since all locally installed modules are placed within your current working directory node_modules directory. i.e. Node modules go in ./node_modules, executables go in ./node_modules/.bin/. So in order to run the browser-sync binary from a local install do the following:

./node_modules/.bin/browser-sync  --version
