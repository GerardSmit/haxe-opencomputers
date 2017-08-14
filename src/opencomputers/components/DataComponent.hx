package opencomputers.components;

import lua.Table;

/**
    The Data (Card) component

    @see http://ocdoc.cil.li/component:data
**/

extern class DataComponent extends Component {

    /**
        Tier 1

        Computes CRC-32 hash of the data. Result is in binary format
    **/
    @luaDotMethod
    public function crc32(data: String): String;

    /**
        Tier 1

        Applies base64 decoding to the data.
    **/
    @luaDotMethod
    public function decode64(data: String): String;

    /**
        Tier 1

        Applies base64 encoding to the data.
    **/
    @luaDotMethod
    public function encode64(data: String): String;

    /**
        Tier 1

        Computes MD5 hash of the data. Result is in binary format
    **/
    @luaDotMethod
    public function md5(data: String): String;

    /**
        Tier 1

        Computes SHA2-256 hash of the data. Result is in binary format.
    **/
    @luaDotMethod
    public function sha256(data: String): String;

    /**
        Tier 1

        Applies deflate compression to the data.
    **/
    @luaDotMethod
    public function deflate(data: String): String;

    /**
        Tier 1

        Applies inflate decompression to the data.
    **/
    @luaDotMethod
    public function inflate(data: String): String;

    /**
        Tier 1

        The maximum size of data
        that can be passed to other functions of the card.
    **/
    @luaDotMethod
    public function getLimit(): Int;

    /**
        Tier 2

        Applies AES encryption to the data using the key and
        (preferably) random IV.
    **/
    @luaDotMethod
    public function encrypt(data: String, key: String, iv: String): String;

    /**
        Tier 2

        Reverses AES encryption on the data using the key and the IV.
    **/
    @luaDotMethod
    public function decrypt(data: String, key: String, iv: String): String;

    /**
        Tier 2

        Generates a random binary string of `len` length.
    **/
    @luaDotMethod
    public function random(len: Int): String;

    /**
        Tier 3

        Generates public/private key pair for various cryptiographic functions.
        Optional second parameter specifies key length,256 or 384 bits accepted.
        Key types include “ec-public” and “ec-private”.

        Keys can be serialized with `key.serialize():string`
        Keys also contain the function `key.isPublic():boolean`
    **/
    @luaDotMethod
    public function generateKeypair(?bitLen: Int): OCKeyPair;

    /**
        Tier 3

        Generates a signiture of data using a private key.
        If signature is present verifies the signature using the public key and
        the previously generated generated signature string. and
        the original string.
    **/
    @luaDotMethod
    public function ecdsa(data: String, key: ECUserdata): EiterType<String, Bool>;

    /**
        Tier 3

        Generates a Diffie-Hellman shared key
        using the first user's private key and the second user's public key.
        An example of a basic key relation:

        `ecdh(userA.private, userB.public) == ecdh(userB.private, usera.public)`
    **/
    @luaDotMethod
    public function ecdh(privateKey: ECUserdata, publicKey: ECUserdata): String;

    /**
        Tier 3

        Transforms a key from string to it's arbitrary type.
    **/
    @luaDotMethod
    public function deserialize(data: String, type: String): ECUserdata;

}

extern class ECUserdata{
    @luaDotMethod
    public function serialize(): String;

    @luaDotMethod
    public function isPublic(): Bool;

    @luaDotMethod
    public function keyType(): String;
}

@:multiReturn
extern class OCKeyPair {
    var keyOne: ECUserdata;
    var keyTwo: ECUserdata;
}
