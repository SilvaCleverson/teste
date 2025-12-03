module 0x1::self_transfer {
use sui::coin::Coin;
    use sui::sui::SUI;
    use sui::transfer;

    const MI_WALLET: address = @0x82b76823af67e9c473e735dd0bbb2d83b8fe42bd5aeae34d28d59ad305a3505d;

    public entry fun enviar_a_mi_mismo(coin: Coin<SUI>) {
        transfer::public_transfer(coin, MI_WALLET);
    }
}