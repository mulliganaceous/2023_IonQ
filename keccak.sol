function KeccakF1600_StatePermute1() public payable
{
    int         round;

    // copyFromState(A, state)
    Aba = shake256_context64[ 0]; Abe = shake256_context64[ 1]; Abi = shake256_context64[ 2]; Abo = shake256_context64[ 3]; Abu = shake256_context64[ 4];
    Aga = shake256_context64[ 5]; Age = shake256_context64[ 6]; Agi = shake256_context64[ 7]; Ago = shake256_context64[ 8]; Agu = shake256_context64[ 9];
    Aka = shake256_context64[10]; Ake = shake256_context64[11]; Aki = shake256_context64[12]; Ako = shake256_context64[13]; Aku = shake256_context64[14];
    Ama = shake256_context64[15]; Ame = shake256_context64[16]; Ami = shake256_context64[17]; Amo = shake256_context64[18]; Amu = shake256_context64[19];
    Asa = shake256_context64[20]; Ase = shake256_context64[21]; Asi = shake256_context64[22]; Aso = shake256_context64[23]; Asu = shake256_context64[24];

    for (round = 0; round < NROUNDS; round += 2)
    {
        ////////////////////////////////////////////////
        // prepareTheta
        BCa = Aba ^ Aga ^ Aka ^ Ama ^ Asa;
        BCe = Abe ^ Age ^ Ake ^ Ame ^ Ase;
        BCi = Abi ^ Agi ^ Aki ^ Ami ^ Asi;
        BCo = Abo ^ Ago ^ Ako ^ Amo ^ Aso;
        BCu = Abu ^ Agu ^ Aku ^ Amu ^ Asu;

        //////////////////////////////////////////////////
        // thetaRhoPiChiIotaPrepareTheta(round  , A, E)
        Da = BCu ^ ((BCe) << (1)) ^ ((BCe) >> (64 - (1)));
        De = BCa ^ ((BCi) << (1)) ^ ((BCi) >> (64 - (1)));
        Di = BCe ^ ((BCo) << (1)) ^ ((BCo) >> (64 - (1)));
        Do = BCi ^ ((BCu) << (1)) ^ ((BCu) >> (64 - (1)));
        Du = BCo ^ ((BCa) << (1)) ^ ((BCa) >> (64 - (1)));
        Aba ^= Da;
        BCa = Aba;

        Age ^= De;
        BCe = ((Age) << (44)) ^ ((Age) >> (64 - (44)));
        Aki ^= Di;
        BCi = ((Aki) << (43)) ^ ((Aki) >> (64 - (43)));
        Amo ^= Do;
        BCo = ((Amo) << (21)) ^ ((Amo) >> (64 - (21)));
        Asu ^= Du;
        BCu = ((Asu) << (14)) ^ ((Asu) >> (64 - (14)));
        Eba = BCa ^ ((~BCe) & BCi);
        Eba ^= KeccakF_RoundConstants[uint256(round)];
        Ebe = BCe ^ ((~BCi) & BCo);
        Ebi = BCi ^ ((~BCo) & BCu);
        Ebo = BCo ^ ((~BCu) & BCa);
        Ebu = BCu ^ ((~BCa) & BCe);

        Abo ^= Do;
        BCa = ((Abo) << (28)) ^ ((Abo) >> (64 - (28)));
        Agu ^= Du;
        BCe = ((Agu) << (20)) ^ ((Agu) >> (64 - (20)));
        Aka ^= Da;
        BCi = ((Aka) << (3)) ^ ((Aka) >> (64 - (3)));
        Ame ^= De;
        BCo = ((Ame) << (45)) ^ ((Ame) >> (64 - (45)));
        Asi ^= Di;
        BCu = ((Asi) << (61)) ^ ((Asi) >> (64 - (61)));
        Ega = BCa ^ ((~BCe) & BCi);
        Ege = BCe ^ ((~BCi) & BCo);
        Egi = BCi ^ ((~BCo) & BCu);
        Ego = BCo ^ ((~BCu) & BCa);
        Egu = BCu ^ ((~BCa) & BCe);

        Abe ^= De;
        BCa = ((Abe) << (1)) ^ ((Abe) >> (64 - (1)));
        Agi ^= Di;
        BCe = ((Agi) << (6)) ^ ((Agi) >> (64 - (6)));
        Ako ^= Do;
        BCi = ((Ako) << (25)) ^ ((Ako) >> (64 - (25)));
        Amu ^= Du;
        BCo = ((Amu) << (8)) ^ ((Amu) >> (64 - (8)));
        Asa ^= Da;
        BCu = ((Asa) << (18)) ^ ((Asa) >> (64 - (18)));
        Eka = BCa ^ ((~BCe) & BCi);
        Eke = BCe ^ ((~BCi) & BCo);
        Eki = BCi ^ ((~BCo) & BCu);
        Eko = BCo ^ ((~BCu) & BCa);
        Eku = BCu ^ ((~BCa) & BCe);

        Abu ^= Du;
        BCa = ((Abu) << (27)) ^ ((Abu) >> (64 - (27)));
        Aga ^= Da;
        BCe = ((Aga) << (36)) ^ ((Aga) >> (64 - (36)));
        Ake ^= De;
        BCi = ((Ake) << (10)) ^ ((Ake) >> (64 - (10)));
        Ami ^= Di;
        BCo = ((Ami) << (15)) ^ ((Ami) >> (64 - (15)));
        Aso ^= Do;
        BCu = ((Aso) << (56)) ^ ((Aso) >> (64 - (56)));
        Ema = BCa ^ ((~BCe) & BCi);
        Eme = BCe ^ ((~BCi) & BCo);
        Emi = BCi ^ ((~BCo) & BCu);
        Emo = BCo ^ ((~BCu) & BCa);
        Emu = BCu ^ ((~BCa) & BCe);

        Abi ^= Di;
        BCa = ((Abi) << (62)) ^ ((Abi) >> (64 - (62)));
        Ago ^= Do;
        BCe = ((Ago) << (55)) ^ ((Ago) >> (64 - (55)));
        Aku ^= Du;
        BCi = ((Aku) << (39)) ^ ((Aku) >> (64 - (39)));
        Ama ^= Da;
        BCo = ((Ama) << (41)) ^ ((Ama) >> (64 - (41)));
        Ase ^= De;
        BCu = ((Ase) << (2)) ^ ((Ase) >> (64 - (2)));
        Esa = BCa ^ ((~BCe) & BCi);
        Ese = BCe ^ ((~BCi) & BCo);
        Esi = BCi ^ ((~BCo) & BCu);
        Eso = BCo ^ ((~BCu) & BCa);
        Esu = BCu ^ ((~BCa) & BCe);

        //////////////////////////////////////////////////
        // prepareTheta
        BCa = Eba ^ Ega ^ Eka ^ Ema ^ Esa;
        BCe = Ebe ^ Ege ^ Eke ^ Eme ^ Ese;
        BCi = Ebi ^ Egi ^ Eki ^ Emi ^ Esi;
        BCo = Ebo ^ Ego ^ Eko ^ Emo ^ Eso;
        BCu = Ebu ^ Egu ^ Eku ^ Emu ^ Esu;

        //////////////////////////////////////////////////
        // thetaRhoPiChiIotaPrepareTheta(round+1, E, A)
        Da = BCu ^ ((BCe) << (1)) ^ ((BCe) >> (64 - (1)));
        De = BCa ^ ((BCi) << (1)) ^ ((BCi) >> (64 - (1)));
        Di = BCe ^ ((BCo) << (1)) ^ ((BCo) >> (64 - (1)));
        Do = BCi ^ ((BCu) << (1)) ^ ((BCu) >> (64 - (1)));
        Du = BCo ^ ((BCa) << (1)) ^ ((BCa) >> (64 - (1)));
        Eba ^= Da;
        BCa = Eba;

        Ege ^= De;
        BCe = ((Ege) << (44)) ^ ((Ege) >> (64 - (44)));
        Eki ^= Di;
        BCi = ((Eki) << (43)) ^ ((Eki) >> (64 - (43)));
        Emo ^= Do;
        BCo = ((Emo) << (21)) ^ ((Emo) >> (64 - (21)));
        Esu ^= Du;
        BCu = ((Esu) << (14)) ^ ((Esu) >> (64 - (14)));
        Aba = BCa ^ ((~BCe) & BCi);
        Aba ^= KeccakF_RoundConstants[uint256(round + 1)];
        Abe = BCe ^ ((~BCi) & BCo);
        Abi = BCi ^ ((~BCo) & BCu);
        Abo = BCo ^ ((~BCu) & BCa);
        Abu = BCu ^ ((~BCa) & BCe);

        Ebo ^= Do;
        BCa = ((Ebo) << (28)) ^ ((Ebo) >> (64 - (28)));
        Egu ^= Du;
        BCe = ((Egu) << (20)) ^ ((Egu) >> (64 - (20)));
        Eka ^= Da;
        BCi = ((Eka) << (3)) ^ ((Eka) >> (64 - (3)));
        Eme ^= De;
        BCo = ((Eme) << (45)) ^ ((Eme) >> (64 - (45)));
        Esi ^= Di;
        BCu = ((Esi) << (61)) ^ ((Esi) >> (64 - (61)));
        Aga = BCa ^ ((~BCe) & BCi);
        Age = BCe ^ ((~BCi) & BCo);
        Agi = BCi ^ ((~BCo) & BCu);
        Ago = BCo ^ ((~BCu) & BCa);
        Agu = BCu ^ ((~BCa) & BCe);

        Ebe ^= De;
        BCa = ((Ebe) << (1)) ^ ((Ebe) >> (64 - (1)));
        Egi ^= Di;
        BCe = ((Egi) << (6)) ^ ((Egi) >> (64 - (6)));
        Eko ^= Do;
        BCi = ((Eko) << (25)) ^ ((Eko) >> (64 - (25)));
        Emu ^= Du;
        BCo = ((Emu) << (8)) ^ ((Emu) >> (64 - (8)));
        Esa ^= Da;
        BCu = ((Esa) << (18)) ^ ((Esa) >> (64 - (18)));
        Aka = BCa ^ ((~BCe) & BCi);
        Ake = BCe ^ ((~BCi) & BCo);
        Aki = BCi ^ ((~BCo) & BCu);
        Ako = BCo ^ ((~BCu) & BCa);
        Aku = BCu ^ ((~BCa) & BCe);

        Ebu ^= Du;
        BCa = ((Ebu) << (27)) ^ ((Ebu) >> (64 - (27)));
        Ega ^= Da;
        BCe = ((Ega) << (36)) ^ ((Ega) >> (64 - (36)));
        Eke ^= De;
        BCi = ((Eke) << (10)) ^ ((Eke) >> (64 - (10)));
        Emi ^= Di;
        BCo = ((Emi) << (15)) ^ ((Emi) >> (64 - (15)));
        Eso ^= Do;
        BCu = ((Eso) << (56)) ^ ((Eso) >> (64 - (56)));
        Ama = BCa ^ ((~BCe) & BCi);
        Ame = BCe ^ ((~BCi) & BCo);
        Ami = BCi ^ ((~BCo) & BCu);
        Amo = BCo ^ ((~BCu) & BCa);
        Amu = BCu ^ ((~BCa) & BCe);

        Ebi ^= Di;
        BCa = ((Ebi) << (62)) ^ ((Ebi) >> (64 - (62)));
        Ego ^= Do;
        BCe = ((Ego) << (55)) ^ ((Ego) >> (64 - (55)));
        Eku ^= Du;
        BCi = ((Eku) << (39)) ^ ((Eku) >> (64 - (39)));
        Ema ^= Da;
        BCo = ((Ema) << (41)) ^ ((Ema) >> (64 - (41)));
        Ese ^= De;
        BCu = ((Ese) << (2)) ^ ((Ese) >> (64 - (2)));
        Asa = BCa ^ ((~BCe) & BCi);
        Ase = BCe ^ ((~BCi) & BCo);
        Asi = BCi ^ ((~BCo) & BCu);
        Aso = BCo ^ ((~BCu) & BCa);
        Asu = BCu ^ ((~BCa) & BCe);
    }

    // copyToState(state, A)
    shake256_context64[ 0] = Aba; shake256_context64[ 1] = Abe; shake256_context64[ 2] = Abi; shake256_context64[ 3] = Abo; shake256_context64[ 4] = Abu;
    shake256_context64[ 5] = Aga; shake256_context64[ 6] = Age; shake256_context64[ 7] = Agi; shake256_context64[ 8] = Ago; shake256_context64[ 9] = Agu;
    shake256_context64[10] = Aka; shake256_context64[11] = Ake; shake256_context64[12] = Aki; shake256_context64[13] = Ako; shake256_context64[14] = Aku;
    shake256_context64[15] = Ama; shake256_context64[16] = Ame; shake256_context64[17] = Ami; shake256_context64[18] = Amo; shake256_context64[19] = Amu;
    shake256_context64[20] = Asa; shake256_context64[21] = Ase; shake256_context64[22] = Asi; shake256_context64[23] = Aso; shake256_context64[24] = Asu;
}