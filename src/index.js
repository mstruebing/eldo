import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const board = JSON.parse(localStorage.getItem('board'));

const app = Main.embed(document.getElementById('root'), board);

app.ports.saveBoardToLocalStorage.subscribe(board => {
    console.log( board );
    localStorage.setItem("board", JSON.stringify(board));
});

registerServiceWorker();
