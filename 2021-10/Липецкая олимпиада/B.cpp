#include <iostream>

using namespace std;
int n,m;

int main(){
  cin >> n >> m;
  char s[n];
  cin >> s;
  int l[m];
  for(int i = 0; i<m; i++){
    cin >> l[i];
  };
  int t = n;
  if(n>10*m){
    for (int i = 0; i<m;i++){
      t = max(t,l[i]);
    };
  };
  int r = 0, R = 0;
  for (int i = 0; i<n; i++){
    if (s[i] == '1'){
      r += 1;
    } else {
      R = max(R,r);
      r = 0;
      if (R>t){
        break;
      };
    };
  };
  R = max(R,r);
  int j;
  for(int i = 0; i<m; i++){
    j = l[i];
    if(j>R){
      cout<<"YES\n";
    } else{
      cout<<"NO\n";
    };
  };
  return 0;
};