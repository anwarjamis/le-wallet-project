import { getFintoc } from '@fintoc/fintoc-js';

const main = async () => {
  const Fintoc = await getFintoc();
  const widget = Fintoc.create({
    holderType: 'individual',
    product: 'movements',
    publicKey: 'pk_test_Qo6z9u6FRnUBMW4xygFXKunztvCpyxbU',
    webhookUrl,
    country: 'cl',
    onSuccess,
    onExit,
    onEvent,
  })
  widget.open();
}

main();
