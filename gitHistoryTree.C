void gitHistoryTree(){
  TGraph * gr = new TGraph("./gitHistoryTreeData/gitHistoryTreeShortUt.dat");
  gr->SetName("git_tree");
  gr->SetTitle("git_tree");
  
  gStyle->SetPalette(1);
  gStyle->SetFrameBorderMode(0);
  gROOT->ForceStyle();
  gStyle->SetStatColor(kWhite);
  //gStyle->SetOptStat(kFALSE);
  
  TCanvas *c1 = new TCanvas("c1","plots",10,10,800,800);
  c1->Clear();
  c1->SetFillColor(kWhite);
  c1->GetPad(0)->SetLeftMargin(0.12);
  c1->GetPad(0)->SetRightMargin(0.02);
  c1->GetPad(0)->SetTopMargin(0.07);
  //c1->GetPad(0)->SetBottomMargin(0.02);


   //TFile f("graph.root", "recreate");
   //f.cd();
   //gr->Write();

  //gr->SetMinimum(0);
  
   gr->Draw("AP");

   gr->SetMarkerStyle(20);
   gr->GetXaxis()->SetTimeDisplay(1);
   gr->GetXaxis()->SetTimeFormat("#splitline{%Y}{%m/%d}%F1970-01-01 00:00:00");
   gr->GetXaxis()->SetLabelOffset(0.025);
   //gr_ut->GetXaxis()->SetTitle("Time, h");
   
}
