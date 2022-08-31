<cfscript>
  // Example PBKDF2 With HMAC SHA1
  resultHMAC = generatePBKDFKey("PBKDF2WithHmacSHA1", "secret", "salty", 5000, 128);

  // complex encryption
  password = "top_secret";
  dataToEncrypt= "the most closely guarded secret";
  encryptionAlgorithm = "AES";
  keysize = 128;
  algorithmVersion = 512;
  PBKDFalgorithm = 'PBKDF2WithHmacSHA' & algorithmVersion;
      
  // Generate key as recommended in docs
  length = keysize / 8;
  multiplicator = 10 ^ length;
  salt = Round(Randomize(5,'SHA1PRNG') * multiplicator);
      
  // The magic happens here
  PBKDFKey = GeneratePBKDFKey(PBKDFalgorithm, password, salt, algorithmVersion, keysize);
  encryptedData = encrypt(dataToEncrypt, PBKDFKey, encryptionAlgorithm, "BASE64"); 
  decryptedData = decrypt(encryptedData, PBKDFKey, encryptionAlgorithm, "BASE64");
      
  //Output
  /*
  writeOutput("<b>Generated PBKDFKey (Base 64)</b>: " & PBKDFKey);
  writeOutput("<br /><b>Data After Encryption</b>: " & encryptedData);
  writeOutput("<br /><b>Data After Decryption</b>: " & decryptedData); 
  */

</cfscript>

<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
            crossorigin="anonymous">
        <title>Document</title>
    </head>
    <body>
        <div class="container">
            <h1>generatePBKDFKey method: </h1>
            <div>
              <a href="https://cfdocs.org/generatepbkdfkey">learn more</a>
            </div>
            <table class="table table-dark table-hover mt-4">
                <thead>
                  <tr>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">PBKDF2 With HMAC SHA1</th>
                    <td>#resultHMAC#</td>
                  </tr>
                  <tr>
                    <th scope="row">complex encryption</th>
                    <td>#encryptedData#</td>
                  </tr>
                </tbody>
              </table>
              <div>
                <a href="/index.cfm" class="btn btn-primary">back</a>
              </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
            crossorigin="anonymous"></script>
    </body>
    </html>

</cfoutput>
