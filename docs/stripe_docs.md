# Stripe Docs

## 2. Stripe CLI

> [Stripe CLI Reference][stripe_cli_reference]

With Stripe CLI, you can create a lab for experimenting with stripe in a quicker manner.

You can also check on the terminal for incoming events, without the need of opening the online dashboard:

```sh
stripe listen
```

Then, in a new terminal, use, for example `stripe customers create` to create a customer or `stripe trigger payment_intent.created`, and check the event on the first terminal.


[stripe_cli_reference]: https://stripe.com/docs/cli

### 2.1. Forward events to your server

When developing an application, you’ll likely want to forward received events to your server. Do so using the `--forward-to` flag when invoking `stripe listen`:

```sh
stripe listen --forward-to localhost:5000/hooks
```

With forwarding established, events that occur continue to show in the terminal, but you’ll also see the response from your server.

### 2.2. Test and monitor your integration

```sh
stripe logs tail
```

