enum StatuFlags {
  all(-1),
  pending(0),
  opened(1),
  closed(2);

  final int value;
  const StatuFlags(this.value);
}
