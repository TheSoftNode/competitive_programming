from math import sqrt
class Solution:
    def countTriples(self, n: int) -> int:
        count = 0

        for a in range(1, n + 1):
            for b in range(1, n + 1):
                c = a * a + b * b
                cs = int(sqrt(c))

                if cs * cs == c and cs <= n:
                    count += 1
        return count