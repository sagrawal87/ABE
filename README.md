# Attribute-based Encryption

Attribute-based encryption enables fine-grained control of encrypted data [SW05]. In a ciphertext-policy ABE (CP-ABE) scheme [GPSW06], for instance, ciphertexts are attached to access policies and keys are associated with sets of attributes. A key is able to recover the message hidden in a ciphertext if and only if the set of attributes *satisfy* the access policy. To give an example, a policy *P* could say *(Zipcode:90210 OR City:BeverlyHills) AND (AgeGroup:18-25)* and an individual *A* could have a key for *({Zipcode:90210}, {AgeGroup:Over65})*, in which case *A* would not be able to decrypt any message encrypted under *P*. A key policy (KP-ABE) scheme, on the other hand, is the dual of CP-ABE with ciphertexts attached to attribute sets and keys associated with access policies.

I have implemented several ABE schemes in Python using the Charm framework [AGMPRGP13]. Specifically, CP-ABE schemes from [BSW07, Section 4.2], [Waters11, Section 3], [CGW15, Appendix B.2 (full version)], and [AC17, Section 3] are implemented. All implementations are based on Type-III pairings; see AC17 for details.

Some of the schemes above are bounded universe, i.e. they support an a-priori bounded number of attributes. To initialize such schemes, an additional parameter `uni_size` needs to be specified. Some schemes are secure under the k-linear family of assumptions, so k must be set properly during initialization through the parameter `assump_size`.

## Prerequisites

The schemes have been tested with Charm 0.43 and Python 2.7.10 on Mac OS X.
Charm 0.43 can be installed from [this](https://github.com/JHUISI/charm/releases) page, or by running
```sh
pip install -r requirements.txt
```
Charm may not compile on Linux systems due to the incompatibility of OpenSSL versions 1.0 and 1.1. You can either install charm-crypto from the system package manager or downgrade OpenSSL to version 1.0.

Once you have Charm, just do
```sh
make && pip install . && python samples/main.py
```
to run the AC17 CP-ABE scheme. You can easily modify `samples/main.py` to try any scheme you wish.

## References

 1. [SW05] Sahai, Amit, and Brent Waters. "Fuzzy identity-based encryption." In Eurocrypt, vol. 3494, pp. 457-473. 2005.
 2. [GPSW06] Goyal, Vipul, Omkant Pandey, Amit Sahai, and Brent Waters. "Attribute-based encryption for fine-grained access control of encrypted data." In Proceedings of the 13th ACM conference on Computer and communications security, pp. 89-98. ACM, 2006. Full version available on ePrint Archive, Report [2006/309](https://eprint.iacr.org/2006/309).
 3. [BSW07] Bethencourt, John, Amit Sahai, and Brent Waters. "Ciphertext-policy attribute-based encryption." In Security and Privacy, 2007. SP'07. IEEE Symposium on, pp. 321-334. IEEE, 2007.
 4. [Waters11] Waters, Brent. "Ciphertext-policy attribute-based encryption: An expressive, efficient, and provably secure realization." In Public Key Cryptography, vol. 6571, pp. 53-70. 2011.
 5. [AGMPRGR13] Akinyele, Joseph A., Christina Garman, Ian Miers, Matthew W. Pagano, Michael Rushanan, Matthew Green, and Aviel D. Rubin. "Charm: a framework for rapidly prototyping cryptosystems." Journal of Cryptographic Engineering 3, no. 2 (2013): 111-128.
 6. [CGW15] Chen, Jie, Romain Gay, and Hoeteck Wee. "Improved Dual System ABE in Prime-Order Groups via Predicate Encodings." In Annual International Conference on the Theory and Applications of Cryptographic Techniques, pp. 595-624. Springer, Berlin, Heidelberg, 2015. Full version available on ePrint Archive, Report [2015/409](https://eprint.iacr.org/2015/409).
 7. [AC17] Agrawal, Shashank, and Melissa Chase. "FAME: fast attribute-based message encryption." In Proceedings of the 2017 ACM SIGSAC Conference on Computer and Communications Security, pp. 665-682. 2017. Full version available on ePrint Archive, Report [2017/807](https://eprint.iacr.org/2017/807).
