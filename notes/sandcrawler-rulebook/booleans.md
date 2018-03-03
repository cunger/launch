# Booleans

**Logical Not (`!`)** converts its operand to a Boolean and then negates it, thus returns a Boolean.

Binary logical operators are:
* _Value-preserving:_ They always return either one of the operands, unchanged.
* _Short-circuiting:_ The second operand is not evaluated if the first operand already determines the result.

**Logical And (`&&`)**:
If the first operand can be converted to `false`, return it. Otherwise, return the second operand.

**Logical Or (`||`)**:
If the first operand can be converted to `true`, return it. Otherwise, return the second operand.
