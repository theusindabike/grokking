import unittest


class SomeKindOfSortingExercicies(unittest.TestCase):
    def test_sort_by(self):
        def sort_by(_list: list[int]) -> list[int]:
            less, equal, greater = [], [], []

            if len(_list) > 1:
                pivot = _list[0]
                for e in _list:
                    if e < pivot:
                        less.append(e)
                    elif e == pivot:
                        equal.append(e)
                    elif e > pivot:
                        greater.append(e)
                return sort_by(less) + equal + sort_by(greater)
            else:
                return _list

        self.assertEqual(sort_by([3, 5, 1, 4, 7]), [1, 3, 4, 5, 7])

    def test_highest_3_elements(self):
        def n_highest_elements(list_1: list[int]) -> list[int]:
            first, second, third = 0, 0, 0

            for e in list_1:
                if e > first:
                    third = second
                    second = first
                    first = e
                elif e > second:
                    third = second
                    second = e
                elif e > third:
                    third = e

            return [first, second, third]

        self.assertEqual(n_highest_elements([3, 5, 1, 4, 7]), [7, 5, 4])

    def test_n_highest_elements(self):
        def n_highest_elements(list_1: list[int]) -> list[int]:
            first, second, third = 0, 0, 0

            for e in list_1:
                if e > first:
                    third = second
                    second = first
                    first = e
                elif e > second:
                    third = second
                    second = e
                elif e > third:
                    third = e

            return [first, second, third]

        self.assertEqual(n_highest_elements([3, 5, 1, 4, 7]), [7, 5, 4])

    def test_merge_two_sorted_list(self):
        def merge_two_sorted_list(list_1: list[int], list_2: list[int]) -> list[int]:
            output = [0]
            l2_enumareted = enumerate(list_2)

            for i1, l1 in enumerate(list_1):
                pass
                # output.append(l1 if l1 < l2 else l2)

            return output

        self.assertEqual(
            merge_two_sorted_list([1, 2, 4], [1, 3, 4]), [1, 1, 2, 3, 4, 4]
        )


if __name__ == "__main__":
    unittest.main()
