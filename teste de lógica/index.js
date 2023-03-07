//EX 01
function solucao1(A) {
    let resultado = 0;
    for (let i = 0; i < A.length; i++) {
      resultado ^= A[i];
    }
    return resultado;
  }
  
//EX 02
function solucao2(arr) {
  const valoresUnicos = {}; 
  for (let i = 0; i < arr.length; i++) {
    const resultado = arr[i];     
    if (!valoresUnicos[resultado]) {
      valoresUnicos[resultado] = true;
    }
  }
  return Object.keys(valoresUnicos).length;
}

//EX 03
function solucao3(N, M) {
  let X = new Array(N).fill(0);
  let i = 0;
  let contador = 0;
  while(X[i] === 0) {
      X[i] = 1;
      i = (i + M) % N;            
      contador++;
  }
  return contador;
}
