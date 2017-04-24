'use babel';

import LoremRicksumAtomView from './lorem-ricksum-atom-view';
import { CompositeDisposable } from 'atom';

export default {
  loremRicksumAtomView: null,
  subscriptions: null,

  activate(state) {
    this.loremRicksumAtomView = new LoremRicksumAtomView(state.loremRicksumAtomViewState);

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();
    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'lorem-ricksum-atom:open-config': () => atom.workspace.open("atom://config/packages/lorem-ricksum-atom"),
    }));
  },

  deactivate() {
    this.subscriptions.dispose();
    this.loremRicksumAtomView.destroy();
  },

  serialize() {
    return {
      loremRicksumAtomViewState: this.loremRicksumAtomView.serialize()
    };
  },

};
