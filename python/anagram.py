def isAnagram(s: str, t: str) -> str:
    if len(s) != len(t):
        return False
    
    s_dict, t_dict = {}, {}

    for i in range(len(s)):
        s_dict[s[i]] = 1 + s_dict.get(s[i], 0)
        t_dict[t[i]] = 1 + t_dict.get(t[i], 0)

    print(s_dict)
    print(t_dict)
    return s_dict == t_dict


def isAnagram_2(self, s: str, t: str) -> str:
        if len(s) != len(t):
            return False

        for e in set(s):            
            if s.count(e) != t.count(e):
                return False

        return True
