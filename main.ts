import { GitlabApi } from './app/gitlab-api';
import * as express from 'express';

// let app = express();
// app.listen(3000, () => console.log(`App is listening on port 3000`));

async function test() {
  let gitlab = new GitlabApi();
  let mrs = await gitlab.openedMRs();

  mrs.forEach(async mr_iid => {
    console.log(`checking MR ${mr_iid}`);
    let files = await gitlab.changedFilesForMR(mr_iid);
    let xaml_files = files.filter(file => file.includes('.xaml'));
    console.log('xaml_files', xaml_files);
    //gitlab.setMRLabels(mr_iid, files.map(x => x.split('/')[1]));
  });
}

test();