import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const board = JSON.parse(localStorage.getItem('board'));

const app = Main.embed(document.getElementById('root'), board);

app.ports.saveBoardToLocalStorage.subscribe(([key, board]) => {
    localStorage.setItem(key, JSON.stringify(board));
});

app.ports.deleteBoardFromLocalStorage.subscribe(key => {
    localStorage.removeItem(key);
});

registerServiceWorker();
