import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

const app = Main.embed(document.getElementById('root'));

app.ports.saveBoardToLocalStorage.subscribe(board => {
    console.log( board );
    localStorage.setItem("board", JSON.stringify(board));
});

registerServiceWorker();
