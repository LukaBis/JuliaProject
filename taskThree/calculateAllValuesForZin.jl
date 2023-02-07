knm_value = calculate_knm(f_value, er_value)
Fnma_value = calculate_Fnm(knm_value, a_value, a_value, n_value)
Fnmb_value = calculate_Fnm(knm_value, a_value, b_value, n_value)
Fnmc_value = calculate_Fnm(knm_value, a_value, c_value, n_value)
Yab_value = calculate_Yab(
    a_value,
    b_value,
    h_value,
    f_value,
    knm_value,
)
ga_value = real(calculate_Yab(
    a_value,
    a_value,
    h_value,
    f_value,
    knm_value,
))
gb_value = real(calculate_Yab(
    b_value,
    b_value,
    h_value,
    f_value,
    knm_value,
))
Yeq_value = calculate_Yeq(
    h_value,
    Fnma_value,
    Fnmb_value,
    Fnmc_value,
    ga_value,
    gb_value,
    Yab_value
)
xa_value = calculateXa(a_value, h_value, er_value)
xb_value = calculateXb(b_value, h_value, er_value)
ae_value = calculateAe(a_value, h_value, xa_value, er_value)
be_value = calculateBe(b_value, h_value, xb_value, er_value)
mn_value = calculate_mn(
    knm_value,
    ae_value,
    be_value,
    n_value
)
C_value = calculate_C(
    mn_value,
    er_value,
    h_value,
    knm_value,
    c_value,
    ae_value,
    n_value
)
L_value = calculate_L(
    mu_value,
    h_value,
    knm_value,
    mn_value,
    c_value,
    ae_value,
    n_value
)
