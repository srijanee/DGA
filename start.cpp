#include<iostream>
#include<fstream>
#include<sstream>
#include<vector>
using namespace std;
int c=0;
void duval(vector<vector<int> > v)
{
	ofstream file("datafile.txt");
	vector<int> ans;
	cout<<v.size()<<endl;
	for(int i=0;i<v.size();i++)
	{
		float p1,p2,p3;
		
		double sum =(v[i][1]+v[i][2]+v[i][4]);
		if(sum==0)
		{
			sum=sum+0.001;
		}
		if(v[i][1]>120 || v[i][2]>50 || v[i][4]>1)
		{
		file<<v[i][0]<<" "<<v[i][1]<<" "<<v[i][2]<<" "<<v[i][3]<<" "<<v[i][4]<<endl;
		p1=v[i][1]*100/sum;
	
		p2=v[i][2]*100/sum;
	
		p3=v[i][4]*100/sum;
	
		if(p1>=98)
		{
			ans.push_back(1);
		}
		else if(p3<4)
		{
			if(p2>=20 && p2<=50)
			{
				ans.push_back(5);
			}
			else if(p2<20)
			{
				ans.push_back(4);
			}
			else
			{
				ans.push_back(8);
			}
		}
		else if(p3<13 && p2<23)
		{
			ans.push_back(2);
		}
		else if(p3<15 && p2>=50)
		{
			ans.push_back(6);
		}
		else if(p3>=29 && p3<=77 && p2>=23 && p2<=40)
		{
			ans.push_back(3);
		}
		else
		{
			ans.push_back(7);
		}
		
		}
		else
		{
			//ans.push_back(-1);
			c++;
		}
	}
	cout<<ans.size()<<endl;
	cout<<c<<endl;
	ofstream a("Output.txt");
	for(int i=0;i<ans.size();i++)
	{
		a<<ans[i]<<endl;
		
	}
	
	
}
int main()
{
	vector<vector<int> >v;
	ifstream file("2.txt");
	char line[512];
	file.getline(line,512,'\n');
	istringstream iss(line);
	string a,b,c,d,e;
	iss>>a>>b>>c>>d>>e;
	int ct=0;
	for(ct=1;ct<=26934;ct++)
	{
		file.getline(line,512,'\n');
		istringstream iss(line);
		vector<int> p;
		for(int i=0;i<5;i++)
		{
			int x;
			iss>>x;
			p.push_back(x);
		}
		v.push_back(p);
	
	}
	
	duval(v);
}

