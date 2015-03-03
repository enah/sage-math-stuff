def pbn(bn_a0, a0, bn_a1, a1):
    return bn_a0*a0 + bn_a1*a1

pb0 = pbn(0.7, 0.5, 0.2, 0.5)
pb1 = pbn(0.3, 0.5, 0.8, 0.5)

def pcnpdm(cn_b0, dn_b0, b0, cn_b1, dn_b1, b1):
    return cn_b0*dn_b0*b0 + cn_b1*dn_b1*b1

pc0pd0 = pcnpdm(0.8, 0.7, pb0, 0.7, 0.5, pb1)
pc1pd0 = pcnpdm(0.2, 0.7, pb0, 0.3, 0.5, pb1)

pc0pd1 = 0.301
pc1pd1 = 0.11

pc0e1 = pc0pd0*0.6 + pc0pd1*0.6
pc1e1 = 0.084

pe1 = pc0pd0*0.6 + pc1pd0*0.5 + pc0pd1*0.6 + pc1pd1*0.1

pc0_e1 = pc0e1/pe1
pc1_e1 = pc1e1/pe1

print pb0
print pb1
print pc0pd0
print pc1pd0
print pc0e1
print pc0_e1
print pc1_e1
