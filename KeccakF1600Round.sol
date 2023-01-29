uint64[25] shake256_context64;
uint32 NROUNDS = 1024;

function perform_KeccakF1600Round(uint64[][] A, uint64[][] E, uint64[] BC, uint64[] D, uint8[][] G) {
    /* Mulliganaceous' modified Keccak function */
    // Produce the initial BC and D vector
    for (uint8 k = 0; k < 5; k++)
        BC[k] = (A[0][k] ^ A[1][k] ^ A[2][k] ^ A[3][k] ^ A[4][k]);
    for (uint8 k = 0; k < 5; k++)
        D[k] = BC[(k - 1) % 5] ^ rol(BC[(k + 1) % 5], 1);
        
    // Ex: Note k is from {a,e,i,o,u} or {b,g,k,m,s}
    uint8 offset = 0;
    for (uint8 j = 0; j < 5; j++) {
        for (uint8 k = 0; k < 5; k++) {
            uint8 koffset = (k + offset) % 5;
            A[k][koffset] ^= D[koffset];
            BC[k] = (A[k][koffset] << G[k][koffset]) ^ (A[k][koffset] >> (64 - G[k][koffset]));
        }
        for (uint8 k = 0; k < 5; k++) {
            uint8 koffset = (k + offset) % 5;
            E[j][k] = BC[k] ^ (~BC[(k + 1)%5] & BC[(k + 2)%5]);
        }
        offset += 3;
    }
}

function KeccakF1600_StatePermute() // public payable
{
    // Deep copy A
    uint64[5][5] A;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            A[i][j] = shake256_context64[5*i + j];
        }
    }
    uint8[][] G = [[ 0, 1,62,28,27],
                   [36,44, 6,55,20],
                   [ 3,10,43,25,39],
                   [41,45,15,21, 8],
                   [18, 2,61,56,14]];
    uint64[5][5] E;
    uint64[5] BC;
    uint64[5] D;

    // Perform loops
    for (uint32 round = 0; round < NROUNDS; round += 2) {
        perform_KeccakF1600Round(A, E, BC, D, G);
        perform_KeccakF1600Round(E, A, BC, D, G);
    }

    // Copy back
    for (uint i = 0; i < 5; i++) {
        for (uint8 j = 0; j < 5; j++) {
            shake256_context64[5*i + j] = A[i][j];
        }
    }
}

function rol(uint64 b, uint64 m) {
    return b;
}