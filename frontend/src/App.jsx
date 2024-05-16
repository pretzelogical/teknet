import { css } from '@emotion/css';

export default function App() {
  return (
    <div className={css({
      display: 'flex',
      flexFlow: 'column',
      height: '100vh'
    })} id="top">
      <header>
        <h1>Teknet</h1>
      </header>
      <main>
        <div>
          <p
          className={css({
            textAlign: 'center'
          })}
          >Post content goes here</p>
        </div>
      </main>
      <footer className={css({
        marginTop: 'auto',
        textAlign: 'center'
      })}>
        <p>Teknet - 2024</p>
      </footer>
    </div>
  );
}
